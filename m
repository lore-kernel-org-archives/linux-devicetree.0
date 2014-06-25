Return-Path: <jlbec@ftp.linux.org.uk>
Date: Wed, 25 Jun 2014 13:52:52 +0100
From: Joel Becker <jlbec@evilplan.org>
Subject: Re: [PATCH] configfs: Implement binary attributes
Message-ID: <20140625125252.GU30852@ZenIV.linux.org.uk>
References: <1403429862-15022-1-git-send-email-pantelis.antoniou@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1403429862-15022-1-git-send-email-pantelis.antoniou@konsulko.com>
Sender: Joel Becker <jlbec@ftp.linux.org.uk>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-ID: <devicetree@vger.kernel.org>

On Sun, Jun 22, 2014 at 12:37:42PM +0300, Pantelis Antoniou wrote:
> ConfigFS lacked binary attributes up until now. This patch
> introduces support for binary attributes in a somewhat similar
> manner of sysfs binary attributes albeit with changes that
> fit the configfs usage model.
> 
> Problems that configfs binary attributes fix are everything that
> requires a binary blob as part of the configuration of a resource,
> such as bitstream loading for FPGAs, DTBs for dynamically created
> devices etc.

I wanted to object on principle, but I actually think I like the way you
did this.  More comments inline.

> 
> Look at Documentation/filesystems/configfs/configfs.txt for internals
> and howto use them.
> 
> This patch generates a bunch of checkpatch warnings, but this stems from
> following the formatting of the configfs code, so please ignore.

I thought someone had looked into cleaning up that cut-n-paste legacy.
I'm fine with new code following sanity..

> @@ -431,7 +438,9 @@ static int configfs_attach_attr(struct configfs_dirent * sd, struct dentry * den
>  	spin_unlock(&configfs_dirent_lock);
>  
>  	error = configfs_create(dentry, (attr->ca_mode & S_IALLUGO) | S_IFREG,
> -				configfs_init_file);
> +				(sd->s_type & CONFIGFS_ITEM_ATTR) ?
> +					configfs_init_file :
> +					configfs_init_bin_file);
>  	if (error) {
>  		configfs_put(sd);
>  		return error;
> @@ -591,6 +600,7 @@ static int populate_attrs(struct config_item *item)
>  {
>  	struct config_item_type *t = item->ci_type;
>  	struct configfs_attribute *attr;
> +	struct configfs_bin_attribute *bin_attr;
>  	int error = 0;
>  	int i;
>  
> @@ -603,6 +613,13 @@ static int populate_attrs(struct config_item *item)
>  		}
>  	}
>  

No need for this blank line.

> +	if (t->ct_bin_attrs) {
> +		for (i = 0; (bin_attr = t->ct_bin_attrs[i]) != NULL; i++) {
> +			if ((error = configfs_create_bin_file(item, bin_attr)))
> +				break;
> +		}
> +	}
> +
>  	if (error)
>  		detach_attrs(item);
>  
> diff --git a/fs/configfs/file.c b/fs/configfs/file.c
> index 1d1c41f..aec051b 100644
> --- a/fs/configfs/file.c
> +++ b/fs/configfs/file.c
> @@ -48,6 +48,10 @@ struct configfs_buffer {
>  	struct configfs_item_operations	* ops;
>  	struct mutex		mutex;
>  	int			needs_read_fill;
> +	int			read_in_progress;
> +	int			write_in_progress;
> +	char			*bin_buffer;
> +	int			bin_buffer_size;
>  };
>  
>  
> @@ -107,8 +111,15 @@ static ssize_t
>  configfs_read_file(struct file *file, char __user *buf, size_t count, loff_t *ppos)
>  {
>  	struct configfs_buffer * buffer = file->private_data;
> +	struct configfs_dirent * sd = file->f_path.dentry->d_fsdata;
>  	ssize_t retval = 0;
>  
> +	if (WARN_ON(sd == NULL))
> +		return -EINVAL;
> +
> +	if (WARN_ON(!(sd->s_type & CONFIGFS_ITEM_ATTR)))
> +		return -EINVAL;
> +
>  	mutex_lock(&buffer->mutex);
>  	if (buffer->needs_read_fill) {
>  		if ((retval = fill_read_buffer(file->f_path.dentry,buffer)))
> @@ -123,6 +134,93 @@ out:
>  	return retval;
>  }
>  
> +/**
> + *	configfs_read_bin_file - read a binary attribute.
> + *	@file:	file pointer.
> + *	@buf:	buffer to fill.
> + *	@count:	number of bytes to read.
> + *	@ppos:	starting offset in file.
> + *
> + *	Userspace wants to read a binary attribute file. The attribute descriptor
> + *	is in the file's ->d_fsdata. The target item is in the directory's
> + *	->d_fsdata.
> + *
> + *	We check whether we need to refill the buffer. If so we will
> + *	call the attributes' ops->read_bin_attribute() twice. The first time we
> + *	will pass a NULL as a buffer pointer, which the attributes' method
> + *	will use to return the size of the buffer required. If no error
> + *	occurs we will allocate the buffer using kmalloc and call 
> + *	ops->read_bin_atribute() again passing that buffer as an argument.
> + *	Then we just copy to user-space using simple_read_from_buffer.
> + */
> +
> +static ssize_t
> +configfs_read_bin_file(struct file *file, char __user *buf, size_t count, loff_t *ppos)
> +{
> +	struct configfs_buffer * buffer = file->private_data;
> +	struct dentry *dentry = file->f_path.dentry;
> +	struct configfs_dirent * sd = dentry->d_fsdata;
> +	struct config_item * item = to_item(dentry->d_parent);
> +	struct configfs_item_operations * ops = buffer->ops;
> +	struct configfs_attribute * attr = to_attr(dentry);
> +	struct configfs_bin_attribute *bin_attr =
> +		container_of(attr, struct configfs_bin_attribute, attr);

You defined to_bin_attr().  Use it here and in write_bin_file() rather
than open-coding the container_of() calls.

> +	ssize_t retval = 0;
> +	ssize_t len = min_t(size_t, count, PAGE_SIZE);
> +
> +	if (WARN_ON(sd == NULL))
> +		return -EINVAL;
> +
> +	if (WARN_ON(!(sd->s_type & CONFIGFS_ITEM_BIN_ATTR)))
> +		return -EINVAL;
> +
> +	mutex_lock(&buffer->mutex);
> +
> +	/* we don't support switching read/write modes */
> +	if (buffer->write_in_progress) {
> +		retval = -EINVAL;
> +		goto out;
> +	}
> +	if (!buffer->read_in_progress)
> +		buffer->read_in_progress = 1;

You can always set read_in_progress, even if the read has already
started.

> +
> +	if (buffer->needs_read_fill) {
> +
> +		/* perform first read with buf == NULL to get extent */
> +		len = ops->read_bin_attribute(item, bin_attr, NULL, 0);
> +		if (len < 0) {
> +			retval = len;
> +			goto out;
> +		}
> +
> +		buffer->bin_buffer = kmalloc(len, GFP_KERNEL);
> +		if (buffer->bin_buffer == NULL) {
> +			retval = -ENOMEM;
> +			goto out;
> +		}
> +		buffer->bin_buffer_size = len;
> +
> +		/* perform second read to fill buffer */
> +		len = ops->read_bin_attribute(item, bin_attr,
> +				buffer->bin_buffer, len);
> +		if (len < 0) {
> +			retval = len;
> +			kfree(buffer->bin_buffer);
> +			buffer->bin_buffer_size = 0;
> +			buffer->bin_buffer = NULL;
> +			goto out;
> +		}
> +
> +		buffer->needs_read_fill = 0;
> +	}
> +
> +	retval = simple_read_from_buffer(buf, count, ppos, buffer->bin_buffer,
> +					buffer->bin_buffer_size);
> +out:
> +	mutex_unlock(&buffer->mutex);
> +	return retval;
> +}
> +
>  
>  /**
>   *	fill_write_buffer - copy buffer from userspace.
> @@ -198,8 +296,15 @@ static ssize_t
>  configfs_write_file(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
>  {
>  	struct configfs_buffer * buffer = file->private_data;
> +	struct configfs_dirent * sd = file->f_path.dentry->d_fsdata;
>  	ssize_t len;
>  
> +	if (WARN_ON(sd == NULL))
> +		return -EINVAL;
> +
> +	if (WARN_ON(!(sd->s_type & CONFIGFS_ITEM_ATTR)))
> +		return -EINVAL;
> +
>  	mutex_lock(&buffer->mutex);
>  	len = fill_write_buffer(buffer, buf, count);
>  	if (len > 0)
> @@ -210,10 +315,80 @@ configfs_write_file(struct file *file, const char __user *buf, size_t count, lof
>  	return len;
>  }
>  
> -static int check_perm(struct inode * inode, struct file * file)
> +/**
> + *	configfs_write_bin_file - write a binary attribute.
> + *	@file:	file pointer
> + *	@buf:	data to write
> + *	@count:	number of bytes
> + *	@ppos:	starting offset
> + *
> + *	Writting to a binary attribute file is similar to a normal read.
> + *	We buffer the consecutive writes (binary attribute files do not
> + *	support lseek) in a continuously growing buffer, but we don't 
> + *	commit until the close of the file.
> + */
> +
> +static ssize_t
> +configfs_write_bin_file(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
> +{
> +	struct configfs_buffer * buffer = file->private_data;
> +	struct dentry *dentry = file->f_path.dentry;
> +	struct configfs_dirent * sd = dentry->d_fsdata;
> +	void *tbuf = NULL;
> +	ssize_t len;
> +
> +	if (WARN_ON(sd == NULL))
> +		return -EINVAL;
> +
> +	if (WARN_ON(!(sd->s_type & CONFIGFS_ITEM_BIN_ATTR)))
> +		return -EINVAL;
> +
> +	mutex_lock(&buffer->mutex);
> +
> +	/* we don't support switching read/write modes */
> +	if (buffer->read_in_progress) {
> +		len = -EINVAL;
> +		goto out;
> +	}
> +	if (!buffer->write_in_progress)
> +		buffer->write_in_progress = 1;
> +
> +	/* buffer grows? */
> +	if (*ppos + count > buffer->bin_buffer_size) {
> +
> +		tbuf = kmalloc(*ppos + count, GFP_KERNEL);
> +		if (tbuf == NULL) {
> +			len = -ENOMEM;
> +			goto out;
> +		}
> +
> +		/* copy old contents */
> +		if (buffer->bin_buffer) {
> +			memcpy(tbuf, buffer->bin_buffer,
> +					buffer->bin_buffer_size);

Fix the argument alignment.  Do this elsewhere in your patch, too.

> +			kfree(buffer->bin_buffer);
> +		}
> +
> +		/* clear the new area */
> +		memset(tbuf + buffer->bin_buffer_size, 0,
> +				*ppos + count - buffer->bin_buffer_size);
> +		buffer->bin_buffer = tbuf;
> +		buffer->bin_buffer_size = *ppos + count;
> +	}
> +
> +	len = simple_write_to_buffer(buffer->bin_buffer, buffer->bin_buffer_size,
> +			ppos, buf, count);
> +	if (len > 0)
> +		*ppos += len;
> +out:
> +	mutex_unlock(&buffer->mutex);
> +	return len;
> +}
> +

<snip>

> diff --git a/fs/configfs/inode.c b/fs/configfs/inode.c
> index 5946ad9..dd9c24b 100644
> --- a/fs/configfs/inode.c
> +++ b/fs/configfs/inode.c
> @@ -231,7 +231,7 @@ const unsigned char * configfs_get_name(struct configfs_dirent *sd)
>  	if (sd->s_type & (CONFIGFS_DIR | CONFIGFS_ITEM_LINK))
>  		return sd->s_dentry->d_name.name;
>  
> -	if (sd->s_type & CONFIGFS_ITEM_ATTR) {
> +	if (sd->s_type & (CONFIGFS_ITEM_ATTR | CONFIGFS_ITEM_BIN_ATTR)) {
>  		attr = sd->s_element;
>  		return attr->ca_name;
>  	}
> diff --git a/include/linux/configfs.h b/include/linux/configfs.h
> index 34025df..15f1079 100644
> --- a/include/linux/configfs.h
> +++ b/include/linux/configfs.h

<snip>

> @@ -207,6 +209,89 @@ static ssize_t _item##_attr_store(struct config_item *item,		\
>  	return ret;							\
>  }
>  
> +struct file;
> +struct vm_area_struct;
> +
> +struct configfs_bin_attribute {
> +	struct configfs_attribute	attr;
> +	void				*private;
> +};

cb_attr and cb_private or similar prefixes, please.

Joel

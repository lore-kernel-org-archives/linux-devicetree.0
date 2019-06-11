From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v7 5/6] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Tue, 11 Jun 2019 11:53:52 +0300
Message-ID: <20190611085352.GA27627@kuha.fi.intel.com>
References: <1559729030-16390-1-git-send-email-pawell@cadence.com>
 <1559729030-16390-6-git-send-email-pawell@cadence.com>
 <20190607101602.GD10298@kuha.fi.intel.com>
 <BYAPR07MB4709F32FF0C6DAE8905703C7DD130@BYAPR07MB4709.namprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BYAPR07MB4709F32FF0C6DAE8905703C7DD130@BYAPR07MB4709.namprd07.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Jayshri Dajiram Pawar <jpawar@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

Hi Pawel,

On Mon, Jun 10, 2019 at 06:33:29AM +0000, Pawel Laszczak wrote:
> >> +static ssize_t cdns3_mode_write(struct file *file,
> >> +				const char __user *ubuf,
> >> +				size_t count, loff_t *ppos)
> >> +{
> >> +	struct seq_file	 *s = file->private_data;
> >> +	struct cdns3 *cdns = s->private;
> >> +	u32 mode = USB_DR_MODE_UNKNOWN;
> >> +	char buf[32];
> >> +	int ret = 0;
> >
> >        int ret;
> >
> >> +	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
> >> +		return -EFAULT;
> >
> >                return -EINVAL;
> 
> Why? I've checked in some place in kernel and after copy_from_user are used EFAULT.
> I think that EINVAL is better but I wanted be  consistent with the rest of kernel. 
> 
> Is there any explanation for this ?

No. You are correct. EFAULT seems to be used with copy_from_user().

thanks,

-- 
heikki

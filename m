From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 11/16] drivers/fsi: Add device read/write/peek functions
Date: Wed, 7 Dec 2016 10:29:07 +0100
Message-ID: <20161207092907.GC14742@kroah.com>
References: <1481076574-54711-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1481076574-54711-4-git-send-email-christopher.lee.bostic@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1481076574-54711-4-git-send-email-christopher.lee.bostic@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chris Bostic <christopher.lee.bostic@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, benh@kernel.crashing.org, geert+renesas@glider.be, andrew@aj.id.au, linux-kernel@vger.kernel.org, mturquette@baylibre.com, linux@armlinux.org.uk, Chris Bostic <cbostic@us.ibm.com>, sre@kernel.org, robh+dt@kernel.org, Jeremy Kerr <jk@ozlabs.org>, alistair@popple.id.au, linux-arm-kernel@lists.infradead.org, joel@jms.id.au
List-Id: devicetree@vger.kernel.org

On Tue, Dec 06, 2016 at 08:09:33PM -0600, Chris Bostic wrote:
> diff --git a/include/linux/fsi.h b/include/linux/fsi.h
> index efa55ba..66bce48 100644
> --- a/include/linux/fsi.h
> +++ b/include/linux/fsi.h
> @@ -27,6 +27,12 @@ struct fsi_device {
>  	uint32_t		size;
>  };
>  
> +extern int fsi_device_read(struct fsi_device *dev, uint32_t addr,
> +		void *val, size_t size);
> +extern int fsi_device_write(struct fsi_device *dev, uint32_t addr,
> +		const void *val, size_t size);
> +extern int fsi_device_peek(struct fsi_device *dev, void *val);
> +
>  struct fsi_device_id {
>  	u8	engine_type;
>  	u8	version;
> @@ -40,7 +46,6 @@ struct fsi_device_id {
>  #define FSI_DEVICE_VERSIONED(t, v) \
>  	.engine_type = (t), .version = (v),
>  
> -
>  struct fsi_driver {
>  	struct device_driver		drv;
>  	const struct fsi_device_id	*id_table;

Strange whitespace change here :)

Not a real problem, I like the fact that you have broken this down into
very logical pieces making it much easier to review, thanks so much for
doing this.

greg k-h

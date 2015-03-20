From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH 2/2] add newhaven lcd tty driver on i2c
Date: Fri, 20 Mar 2015 15:46:19 -0500
Message-ID: <alpine.DEB.2.02.1503201543090.3594@linuxheads99>
References: <1426624607-2832-1-git-send-email-atull@opensource.altera.com>
 <1426624607-2832-3-git-send-email-atull@opensource.altera.com>
 <20150317211605.GB8441@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-977857078-1426884396=:3594"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150317211605.GB8441@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.cz>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvanderv@opensource.altera.com
List-Id: devicetree@vger.kernel.org

--8323329-977857078-1426884396=:3594
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT

On Tue, 17 Mar 2015, Greg Kroah-Hartman wrote:

> On Tue, Mar 17, 2015 at 03:36:47PM -0500, Alan Tull wrote:
> > Supports the Newhaven NHD‐0216K3Z‐NSW‐BBW 2x16 LCD module as i2c slave.
> > Devices will show up as /dev/ttyLCD0, etc.
> > 
> >  * Backspace is supported to the beginning of the current line.
> >     * i.e. printf '\b' > /dev/ttyLCD0
> > 
> >  * ESC [ 2 J
> >     * erase whole display and reset cursor to home.
> >     * i.e. printf '\e[2J' > /dev/ttyLCD0
> > 
> >  * ESC [ 2 K
> >     * erase current line and set cursor to beginning of line.
> >     * i.e. printf '\e[2K' > /dev/ttyLCD0
> > 
> >  * CR and LF are supported.
> > 
> >  * Vertical scroll when cursor is on bottom line and receive end of line.
> > 
> > Default brightness can be set from the device tree/plat data.
> > 
> > Brightness can be set from a sysfs file, for example:
> >  * echo 6 > /sys/devices/soc.0/ffc04000.i2c/i2c-0/0-0028/brightness
> > 
> > Signed-off-by: Alan Tull <atull@opensource.altera.com>
> 
> This should use the new fb_tft api instead of trying to look like a tty
> device.  That framework is merged in the staging-next branch of the
> staging.git kernel tree and will show up in 4.1-rc1.  Please port this
> driver to that api and submit a patch for me to take for the staging
> tree so that we don't have one-off devices like this.
> 

Hi Greg,

This isn't framebuffer type of device.  It's two rows of 16 characters
and you can write ascii characters to it.  If there's another framework
more suited to this, that would be great.

Alan

> thanks,
> 
> greg k-h
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 
--8323329-977857078-1426884396=:3594--

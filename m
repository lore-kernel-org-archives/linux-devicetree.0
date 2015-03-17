From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2] add newhaven lcd tty driver on i2c
Date: Tue, 17 Mar 2015 22:16:05 +0100
Message-ID: <20150317211605.GB8441@kroah.com>
References: <1426624607-2832-1-git-send-email-atull@opensource.altera.com>
 <1426624607-2832-3-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1426624607-2832-3-git-send-email-atull@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Tull <atull@opensource.altera.com>
Cc: Jiri Slaby <jslaby@suse.cz>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvanderv@opensource.altera.com
List-Id: devicetree@vger.kernel.org

On Tue, Mar 17, 2015 at 03:36:47PM -0500, Alan Tull wrote:
> Supports the Newhaven NHD=E2=80=900216K3Z=E2=80=90NSW=E2=80=90BBW 2x1=
6 LCD module as i2c slave.
> Devices will show up as /dev/ttyLCD0, etc.
>=20
>  * Backspace is supported to the beginning of the current line.
>     * i.e. printf '\b' > /dev/ttyLCD0
>=20
>  * ESC [ 2 J
>     * erase whole display and reset cursor to home.
>     * i.e. printf '\e[2J' > /dev/ttyLCD0
>=20
>  * ESC [ 2 K
>     * erase current line and set cursor to beginning of line.
>     * i.e. printf '\e[2K' > /dev/ttyLCD0
>=20
>  * CR and LF are supported.
>=20
>  * Vertical scroll when cursor is on bottom line and receive end of l=
ine.
>=20
> Default brightness can be set from the device tree/plat data.
>=20
> Brightness can be set from a sysfs file, for example:
>  * echo 6 > /sys/devices/soc.0/ffc04000.i2c/i2c-0/0-0028/brightness
>=20
> Signed-off-by: Alan Tull <atull@opensource.altera.com>

This should use the new fb_tft api instead of trying to look like a tty
device.  That framework is merged in the staging-next branch of the
staging.git kernel tree and will show up in 4.1-rc1.  Please port this
driver to that api and submit a patch for me to take for the staging
tree so that we don't have one-off devices like this.

thanks,

greg k-h

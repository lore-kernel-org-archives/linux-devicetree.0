From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2] misc: hx8837: add a HiMax HX8837 display controller
 driver
Date: Tue, 27 Nov 2018 08:41:40 +0100
Message-ID: <20181127074140.GB13965@kroah.com>
References: <20181112023929.650002-1-lkundrak@v3.sk>
 <20181112023929.650002-2-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181112023929.650002-2-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 12, 2018 at 03:39:29AM +0100, Lubomir Rintel wrote:
> HiMax HX8837 is a display controller used on OLPC platforms. It controls
> backlight and is able to capture and freeze a frame when the LCD controller
> (and the rest of the plaform) is powered off.
> 
> This driver is based on the same code as drivers/staging/olpc_dcon.
> I modernized it to use managed GPIO, device-tree bindings, sysfs attribtue
> groups, essentially fixing the staging driver's TODO.

You are creating custom sysfs files, with no Documentation/ABI/ update
for us to know what those files are or how they are used :(

Why do you need custom sysfs files in the first place?  Isn't there
already an api for this type of device in the kernel?

thanks,

greg k-h

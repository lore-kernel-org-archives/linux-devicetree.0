From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/3] misc: bmp085: Add missing platform data.
Date: Fri, 15 Nov 2013 14:58:59 +0100
Message-ID: <201311151459.00293.arnd@arndb.de>
References: <1384465609-26485-1-git-send-email-marek@goldelico.com> <1384465609-26485-4-git-send-email-marek@goldelico.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1384465609-26485-4-git-send-email-marek@goldelico.com>
Sender: linux-doc-owner@vger.kernel.org
To: Marek Belisko <marek@goldelico.com>
Cc: gregkh@linuxfoundation.org, neilb@suse.de, hns@goldelico.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, rob@landley.net, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thursday 14 November 2013, Marek Belisko wrote:
> DT bindings contains more parameters to set so add them to platform data also
> to have possibility to use on arch where DT isn't available yet.
> 
> Signed-off-by: Marek Belisko <marek@goldelico.com>

Can you give an example of a platform that uses this chip and cannot
yet use DT in the mainline kernel? 
If it's only for out-of-tree platforms, I'd prefer to leave this
patch out of tree as well and put the burden on whoever maintains
a non-DT platform in a private kernel.


> diff --git a/include/linux/i2c/bmp085.h b/include/linux/i2c/bmp085.h
> index b66cb98..addb972 100644
> --- a/include/linux/i2c/bmp085.h
> +++ b/include/linux/i2c/bmp085.h

Shouldn't this be in include/linux/platform_data? 

	Arnd

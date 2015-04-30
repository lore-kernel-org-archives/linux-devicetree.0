From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH 0/3] Using SPI NOR flah on sunxi.
Date: Thu, 30 Apr 2015 20:34:36 +0200
Message-ID: <201504302034.36753.marex@denx.de>
References: <cover.1430403750.git.hramrach@gmail.com> <OF23B05612.4290AF80-ONC1257E37.00589292-C1257E37.005AB106@rohde-schwarz.com> <CAOMqctRLnCJfVCYGjsmhORYNk+HCf07wwSXnZv4oqDxbaQqKGw@mail.gmail.com>
Reply-To: marex-ynQEQJNshbs@public.gmane.org
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-sunxi+bncBDIOBYPK6QDRB5VORKVAKGQEH3B3XDA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAOMqctRLnCJfVCYGjsmhORYNk+HCf07wwSXnZv4oqDxbaQqKGw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thomas.Betker-Bf/A/FSCP0w3s4ca2cGeAgC/G2K4zDHf@public.gmane.org, Alison Chaiken <alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "Bean Huo ????????? (beanhuo)" <beanhuo-AL4WhLSQfzjQT0dZR+AlfA@public.gmane.org>, Ben Hutchings <ben-/+tVBieCtBitmTQ+vhA3Yw@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "grmoore-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org" <grmoore-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd <linux-mtd-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mika Westerberg <mika.westerberg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rafa?? Mi??ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday, April 30, 2015 at 06:56:18 PM, Michal Suchanek wrote:
> On 30 April 2015 at 18:30,  <Thomas.Betker-Bf/A/FSCP0w3s4ca2cGeAgC/G2K4zDHf@public.gmane.org> wrote:
> > Hello Michal:
> >> I tried to connect a SPI NOR flash to my sunxi board and due to the
> > 
> > current
> > 
> >> sunxi SPI driver limitations it does not work.
> >> 
> >> The SPI driver returns an error when more than 64 bytes are
> >> transferred at once
> >> due to lack of DMA support.
> > 
> > Wouldn't it be easier to fix the SPI driver to handle transfers larger
> > than 64 bytes, filling and draining the FIFO multiple times if
> > neccessary? (As far as I can tell, most SPI drivers do this.)
> 
> Yes, the intent is to fix this by adding dma support to the driver,
> eventually.
> 
> The patch might be still useful for other hardware with developing SPI
> support.

Please just fix the controller driver to correctly handle arbitrary transfer
lengths.

Best regards,
Marek Vasut

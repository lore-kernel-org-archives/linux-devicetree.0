From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH 01/15] ARM: dts: sun8i-a33: Remove heading 0 in
 video-codec unit address
Date: Fri, 16 Nov 2018 10:59:43 +0100
Message-ID: <2866553ef5e5bb293e099ec7c281111e0a6f86dc.camel@bootlin.com>
References: <20181115145013.3378-1-paul.kocialkowski@bootlin.com>
         <20181115145013.3378-2-paul.kocialkowski@bootlin.com>
         <CAGb2v679sG+KqmkGway8E-CdgQa8ybBv8K2RdNwfB7zWAJkaXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGb2v679sG+KqmkGway8E-CdgQa8ybBv8K2RdNwfB7zWAJkaXQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devel@driverdev.osuosl.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-sunxi@googlegroups.com, Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org

Hi,

Le jeudi 15 novembre 2018 à 23:50 +0800, Chen-Yu Tsai a écrit :
> On Thu, Nov 15, 2018 at 10:50 PM Paul Kocialkowski
> <paul.kocialkowski@bootlin.com> wrote:
> > This cosmetic change removes the heading 0 in the video-codec unit
> > address, as it's done for other nodes.
> > 
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> 
> Nit: I'd prefer the subject prefix format be "<family>: <soc>: ... ",
> or "sun8i: a33:" in this case. This format seems to be used more often
> than your alternative format.
> 
> I can fix it up when applying.

Understood, I will make sure to follow this convention next time.

Cheers,

Paul

> Acked-by: Chen-Yu Tsai <wens@csie.org>
> 
> ChenYu

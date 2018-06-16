From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH RFC 0/2] regulator: pfuze100: add pfuze3001 support
Date: Sat, 16 Jun 2018 21:25:21 +0200 (CEST)
Message-ID: <2103480434.399682.1529177121085@email.1und1.de>
References: <1529063093-19582-1-git-send-email-stefan.wahren@i2se.com>
 <CAOMZO5D7FAiE8dXKmLHCmOdHek4w_LuYjz8uP9jdD7U6Z-7f5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5D7FAiE8dXKmLHCmOdHek4w_LuYjz8uP9jdD7U6Z-7f5Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>, NXP Linux Team <linux-imx@nxp.com>, Anson Huang <Anson.Huang@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio,

> Fabio Estevam <festevam@gmail.com> hat am 16. Juni 2018 um 20:40 geschrieben:
> 
> 
> Hi Stefan,
> 
> On Fri, Jun 15, 2018 at 8:44 AM, Stefan Wahren <stefan.wahren@i2se.com> wrote:
> > This patch series adds support for the NXP PMIC PF3001. This
> > based mostly on the patches by Robin Gong and Mauro Salvini from
> > here [1].
> >
> > [1] - https://community.nxp.com/docs/DOC-331899
> >
> > Stefan Wahren (2):
> >   dt-bindings: pfuze100: add pfuze3001 support
> >   regulator: pfuze100: add pfuze3001 support
> 
> This series looks good.
> 
> Any particular reason for marking it as RFC?

since most of the changes based on Robin's and Mauro's work. 

> 
> Thanks

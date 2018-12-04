From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v3 1/3] usb: chipidea: imx: support configuring for
 active low oc signal
Date: Tue, 4 Dec 2018 14:39:56 +0100
Message-ID: <20181204133956.54qe44fwcbfw46s3@pengutronix.de>
References: <20181204083131.12524-1-u.kleine-koenig@pengutronix.de>
 <20181204083131.12524-2-u.kleine-koenig@pengutronix.de>
 <ce751026-d61f-400e-cb5d-abd9d45dc05f@i2se.com>
 <20181204085250.o4vaviz7ta43zpfo@pengutronix.de>
 <05dbcf6d-1551-31b4-4c9b-fb713fc71362@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <05dbcf6d-1551-31b4-4c9b-fb713fc71362@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Peter Chen <Peter.Chen@nxp.com>, devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, linux-usb@vger.kernel.org, Matthew Starr <mstarr@hedonline.com>, Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello,

On Tue, Dec 04, 2018 at 12:43:21PM +0100, Stefan Wahren wrote:
> Am 04.12.18 um 09:52 schrieb Uwe Kleine-K=F6nig:
> > But for the review you are right, I added the dt people to Cc for them
> > to comment. In v2 Matthew also noted that he would prefer to handle the
> > situation when both over-current-active-low and over-current-active-high
> > were given differently. I think we don't need that as this is a case of
> > "broken dt" and it doesn't matter much what is done then. (With my patch
> > we're configuring for active high in that case.) A feedback here would
> > be great, too.
> =

> AFAIR such invalid settings should be catched with a proper error
> message and abort of the probing.

I remember a review commend from Rob[1]: "It is not really the kernel's
job to validate crap in bindings. If you put [strange things] in your
DT, then the kernel may or may not handle that."

If this applies here, too, the current patches are fine.

Best regards
Uwe

[1] https://patchwork.kernel.org/patch/8776441/

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

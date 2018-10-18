From: Shyam Saini <shyam.saini@amarulasolutions.com>
Subject: Re: [PATCH] ARM: dts: imx: Add missing stdout-path property
Date: Thu, 18 Oct 2018 20:28:32 +0530
Message-ID: <CA+drQ_PHmKCbmfW9HMSpzMsd+W22mhMCL7cj=+WJA8zN=n-C_Q@mail.gmail.com>
References: <20181018145128.21117-1-shyam.saini@amarulasolutions.com>
 <CAOMZO5Di60q+ma2ASe-PbSitAPMEBvWN1Sa2uQY6CKN6rEkSgg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOMZO5Di60q+ma2ASe-PbSitAPMEBvWN1Sa2uQY6CKN6rEkSgg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: festevam@gmail.com
Cc: devicetree@vger.kernel.org, s.hauer@pengutronix.de, linux-imx@nxp.com, Jagan Teki <jagan@amarulasolutions.com>, kernel@pengutronix.de, fabio.estevam@nxp.com, Michael Nazzareno Trimarchi <michael@amarulasolutions.com>, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org, l.stach@pengutronix.de
List-Id: devicetree@vger.kernel.org

>
> On Thu, Oct 18, 2018 at 11:52 AM Shyam Saini
> <shyam.saini@amarulasolutions.com> wrote:
> >
> > This would help us to get early boot logs by passing "earlycon" to
> > kernel bootargs.
> >
> > Further, by adding this we don't have to depend on complex earlyprintk
> > configs for early boot logs.
> >
> > Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
>
> In the Subject please mention the board name:

Thanks Fabio for your suggestion.
I'll resend the V2 with changes.

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v4 1/5] clk: actions: Add REGMAP as dependency
Date: Sun, 15 Jul 2018 19:45:51 +0530
Message-ID: <20180715141551.GA9980@Mani-XPS-13-9360>
References: <20180715123145.16975-1-sravanhome@gmail.com>
 <20180715123145.16975-2-sravanhome@gmail.com>
 <b0e29fe8-c16a-e783-8877-d01f052ba963@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <b0e29fe8-c16a-e783-8877-d01f052ba963@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: mark.rutland@arm.com, support@cubietech.com, linux@cubietech.com, Saravanan Sekar <sravanhome@gmail.com>, devicetree@vger.kernel.org, sboyd@kernel.org, catalin.marinas@arm.com, mturquette@baylibre.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, thomas.liau@actions-semi.com, darren@cubietech.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, pn@denx.de, linux-clk@vger.kernel.org, jeff.chen@actions-semi.com, mp-cs@actions-semi.com
List-Id: devicetree@vger.kernel.org

Hi,

On Sun, Jul 15, 2018 at 02:35:53PM +0200, Andreas F=E4rber wrote:
> Hi,
> =

> Am 15.07.2018 um 14:31 schrieb Saravanan Sekar:
> > Add REGMAP as dependency to avoid undefined reference to regmap symbol
> =

> Is this a bugfix for S900? Then please add a Fixes: line. If not, why is
> it a separate patch and not in 3/5?
> =


Yes, this is a bug fix for S900 clk and should have Fixes tag.

Thanks,
Mani

> Also, the subject is fine as is, but please add a full stop at the end
> of the sentence in the commit message.
> =

> Regards,
> Andreas
> =

> =

> -- =

> SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> GF: Felix Imend=F6rffer, Jane Smithard, Graham Norton
> HRB 21284 (AG N=FCrnberg)

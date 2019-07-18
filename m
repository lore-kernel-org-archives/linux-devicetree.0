From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2] pinctrl: msm8998: Squash TSIF pins together
Date: Thu, 18 Jul 2019 06:34:11 -0700
Message-ID: <20190718133411.GA7234@tuxbook-pro>
References: <503b2ae8-ead6-70cd-7b21-ce5f5166a23a@free.fr>
 <20190704163527.GJ12249@tuxbook-pro>
 <7431cf2d-4406-ff0c-331a-6ab82cf48b1f@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <7431cf2d-4406-ff0c-331a-6ab82cf48b1f@free.fr>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc: DT <devicetree@vger.kernel.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, MSM <linux-arm-msm@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Jonathan Neusch?fer <j.neuschaefer@gmx.net>, Rob Herring <robh+dt@kernel.org>, gpio <linux-gpio@vger.kernel.org>, Andy Gross <agross@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu 18 Jul 02:30 PDT 2019, Marc Gonzalez wrote:

> On 04/07/2019 18:35, Bjorn Andersson wrote:
> 
> > On Thu 04 Jul 01:57 PDT 2019, Marc Gonzalez wrote:
> > 
> >> TSIF is the Transport Stream Interface.
> >> First, rename tsif1 to tsif0, and tsif2 to tsif1.
> >> Then squash all 5 tsif0 pins into a single function.
> >> Same for tsif1.
> >>
> >> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> > 
> > Thanks for the respin Marc.
> > 
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Can you or Andy pick it up for inclusion in linux-next?
> 

This is Linus' subsystem, so I expect that he will pick it up after the
merge window closes.

Regards,
Bjorn

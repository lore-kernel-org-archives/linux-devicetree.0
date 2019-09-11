From: =?utf-8?B?SmFtZXMgVGFpW+aItOW/l+WzsF0=?= <james.tai@realtek.com>
Subject: RE: [PATCH] dt-bindings: arm: Convert Realtek board/soc bindings to
 json-schema
Date: Wed, 11 Sep 2019 07:19:06 +0000
Message-ID: <43B123F21A8CFE44A9641C099E4196FFCF8DA124@RTITMBSVM04.realtek.com.tw>
References: <20190905081721.1548-1-james.tai@realtek.com>
 <CAL_JsqKGX1n-jsi0xtG8_Q=1LAhT=ufe0y2ZNBNoE3fR10K_xQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqKGX1n-jsi0xtG8_Q=1LAhT=ufe0y2ZNBNoE3fR10K_xQ@mail.gmail.com>
Content-Language: zh-TW
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, "jamestai.sky@gmail.com" <jamestai.sky@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Phinex Hung <phinex@realtek.com>, =?utf-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, "moderated
 list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> Subject: Re: [PATCH] dt-bindings: arm: Convert Realtek board/soc bindings to
> json-schema
> 
> On Thu, Sep 5, 2019 at 9:19 AM <jamestai.sky@gmail.com> wrote:
> >
> > From: "james.tai" <james.tai@realtek.com>
> >
> > Convert Realtek SoC bindings to DT schema format using json-schema.
> >
> > Signed-off-by: james.tai <james.tai@realtek.com>
> > ---
> >  .../devicetree/bindings/arm/realtek.txt       | 22 -------------------
> >  .../devicetree/bindings/arm/realtek.yaml      | 17 ++++++++++++++
> >  2 files changed, 17 insertions(+), 22 deletions(-)  delete mode
> > 100644 Documentation/devicetree/bindings/arm/realtek.txt
> >  create mode 100644
> Documentation/devicetree/bindings/arm/realtek.yaml
> 
> I've already submitted a patch for this that's *still* waiting on Andreas to apply
> or comment on the licensing.

Thanks for your reply.

> Also, your patch isn't valid schema. Please check with 'make
> dt_binding_check'.
> 
I will check with 'make dt_binding_check'. 
Thanks!

> ------Please consider the environment before printing this e-mail.

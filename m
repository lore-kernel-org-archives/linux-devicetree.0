From: Tony Lindgren <tony@atomide.com>
Subject: Re: Query on pinctrl usage for DT nodes
Date: Wed, 10 Apr 2013 13:34:09 -0700
Message-ID: <20130410203408.GP10155@atomide.com>
References: <CA+V-a8uiPwsAD--OHFAE=i2ed+-wbXm4p2deZXr92+Zv6GDS1w@mail.gmail.com>
 <515C5C76.3080009@wwwdotorg.org>
 <CA+V-a8t3wtP77DdeUoQHKMjAuWmV+ude+1J3UjJmMTqobgStjA@mail.gmail.com>
 <5162FD4A.1030909@wwwdotorg.org>
 <CA+V-a8vwdCkyMqiynj5BodXbjwJ=e4qNb-29FhLweqbjc7DBQA@mail.gmail.com>
 <5165A22B.4070200@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <5165A22B.4070200@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Stephen Warren <swarren@nvidia.com>, linus.walleij@linaro.org, Peter Ujfalusi <peter.ujfalusi@ti.com>, Prabhakar Lad <prabhakar.csengg@gmail.com>, device-tree <devicetree-discuss@lists.ozlabs.org>, LAK <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

* Stephen Warren <swarren@wwwdotorg.org> [130410 10:37]:
> On 04/10/2013 02:12 AM, Prabhakar Lad wrote:
> ...
> > Following is the proposed fix/hack let me know if its OK.
> > 
> > Regards,
> > --Prabhakar
> > 
> > ->>>>>>>>>>>>>>>>>>>
> > 
> > diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
> > index ee72f1f..78fb42d 100644
> > --- a/drivers/pinctrl/core.h
> > +++ b/drivers/pinctrl/core.h
> > @@ -46,6 +46,7 @@ struct pinctrl_dev {
> >         struct pinctrl *p;
> >         struct pinctrl_state *hog_default;
> >         struct pinctrl_state *hog_sleep;
> > +       bool bits_per_mux;
> 
> This clearly isn't correct; any change to solve this problem should only
> touch the internals of the pinctrl-single driver, not the pinctrl core.

Yeah how about just change the pintctrl-single,bits register
naming to be register + bit?  Something like 0xdeadbeef.0 and
0xdeadbeef.1 and so on.

Regards,

Tony

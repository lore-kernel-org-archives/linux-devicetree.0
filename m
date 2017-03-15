From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 3/6] dt-bindings: iio: document interrupt trigger
 support
Date: Wed, 15 Mar 2017 14:29:28 -0500
Message-ID: <20170315192928.p35tsixaokqxulwq@rob-hp-laptop>
References: <1488300679-3259-1-git-send-email-fabrice.gasnier@st.com>
 <1488300679-3259-4-git-send-email-fabrice.gasnier@st.com>
 <e6e2f05f-0dc0-f2a3-064b-268776a413c5@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <e6e2f05f-0dc0-f2a3-064b-268776a413c5@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jonathan Cameron <jic23@kernel.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, benjamin.gaignard@linaro.org, lars@metafoo.de, alexandre.torgue@st.com, linux-iio@vger.kernel.org, pmeerw@pmeerw.net, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, knaack.h@gmx.de, Fabrice Gasnier <fabrice.gasnier@st.com>, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, benjamin.gaignard@st.com
List-Id: devicetree@vger.kernel.org

On Sun, Mar 05, 2017 at 12:16:28PM +0000, Jonathan Cameron wrote:
> On 28/02/17 16:51, Fabrice Gasnier wrote:
> > Document interrupt trigger that takes a generic interrupt, and
> > can be used as trigger source for sampling devices such as sensors,
> > ADCs...
> > 
> > Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> I'm not convinced we want the earlier device tree binding doc at all.
> In the vast majority of cases that chunk on providers is irrelevant.
> What matters is to document the specific case as you have done here.
> 
> So this one I like, the earlier document less so, simply because
> it repeats what this more specific document has described.
> 
> So Rob, what do you think of 'just' this bit?

Yeah, it seems fine. Though, the #io-trigger-cells can be dropped.

Rob

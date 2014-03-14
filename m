From: srinivas kandagatla <srinivas.kandagatla@st.com>
Subject: Re: [PATCH v4 4/6] pinctrl: st: Use ARRAY_SIZE instead of raw value
 for number of delays
Date: Fri, 14 Mar 2014 09:46:49 +0000
Message-ID: <5322D009.3090000@st.com>
References: <1394614210-15698-1-git-send-email-maxime.coquelin@st.com>	<1394614210-15698-5-git-send-email-maxime.coquelin@st.com>	<1394634313.28839.57.camel@joe-AO722>
 <CACRpkda0Z15zC=d8xe+KyHqgmTCHbnUjL14fBmtscpR-2kHtFQ@mail.gmail.com>
 <5322CF87.5000301@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5322CF87.5000301@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Coquelin <maxime.coquelin@st.com>, Linus Walleij <linus.walleij@linaro.org>, Joe Perches <joe@perches.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, kernel@stlinux.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stuart Menefy <stuart.menefy@st.com>, Rob Herring <robh+dt@kernel.org>, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Lee Jones <lee.jones@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 14/03/14 09:44, Maxime Coquelin wrote:
>>>
>>> drivers/pinctrl/pinctrl-st.c-   unsigned int    *input_delays;
>>> drivers/pinctrl/pinctrl-st.c-   unsigned int    *output_delays;
>>>
>>> It may be better to change these to const unsigned int *
>>> and change
>>>
>>> static unsigned int stih416_delays[] = {
>>>
>>> to static const
>>
>> Good point. Patches accepted :-)
> 
> Sorry Joe, I forgot to reply.
> 
> I added this to my todo list.
> I will provide the change before end of next week.
> 
Thanks Maxime for taking care of this...

--srini
> Thanks,
> Maxime

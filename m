From: Maxime Coquelin <maxime.coquelin@st.com>
Subject: Re: [PATCH v4 6/6] ARM: dts: STiH407: Add B2120 board support
Date: Tue, 20 May 2014 09:53:57 +0200
Message-ID: <537B0A15.409@st.com>
References: <1394614210-15698-1-git-send-email-maxime.coquelin@st.com>
 <1394614210-15698-7-git-send-email-maxime.coquelin@st.com>
 <CAOesGMg5Jk_XB3zdfKz8VxRObYbFO8OMuRyo7Ba-kavANbci1w@mail.gmail.com>
 <20140520072048.GC20874@lee--X1>
 <CAOesGMioLwX3jgGEsR=rHV0u6yR54b4x8BfyZ91vjJnMapUHew@mail.gmail.com>
 <20140520074353.GD20874@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140520074353.GD20874@lee--X1>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lee Jones <lee.jones@linaro.org>, Olof Johansson <olof@lixom.net>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, "kernel@stlinux.com" <kernel@stlinux.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@st.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stuart Menefy <stuart.menefy@st.com>, Rob Herring <robh+dt@kernel.org>, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



On 05/20/2014 09:43 AM, Lee Jones wrote:
>>>>> +       soc {
>>>>> +               sbc_serial0: serial@9530000 {
>>>>> +                       status = "okay";
>>>>> +               };
>>>>
>>>> You might want to consider reference-based syntax here instead, so you
>>>> don't have to mimic the hierarchy. That'd be (at the root level of the
>>>> file, below this secion:
>>>>
>>>> &sbc_serial0: {
>>>>          status = "okay";
>>>> };
>>>
>>> I'm personally not keen on this scheme.  It's sometimes helpful to know
>>> the hierarchy and I don't think it's a large overhead to format the
>>> subordinate DTS files in this way.
>>>
>>> Please consider not enforcing this.
>>
>> Definitely not enforcing it, and I didn't use to like it either but it
>> has some real upsides.
>>
>> In particular, it saves a lot of grief when you're changing something
>> like the unit-id of a node in .dtsi and forget to do the same update
>> in the dts.
>
> I'm not entirely sure what a unit-id is, but I can see that there
> would be benefits to using the referenced-based syntax as you call
> it.  If any of those benefits hold true here I won't push back, but I
> would personally like to see us default to the hierarchical scheme.


+1, I would prefer to keep the hierarchical scheme.

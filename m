From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: Re: [PATCH v8 15/18] ARM: STi: DT: STiH407: Add uniperif reader dt
 nodes
Date: Mon, 5 Sep 2016 14:20:06 +0200
Message-ID: <ae089830-b7c8-ee83-f697-6ff93f2646ed@st.com>
References: <1472223413-7254-1-git-send-email-peter.griffin@linaro.org>
 <1472223413-7254-16-git-send-email-peter.griffin@linaro.org>
 <20160830100148.GO1661@dell>
 <20160830142112.GA22514@griffinp-ThinkPad-X1-Carbon-2nd>
 <20160831112819.GJ27357@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160831112819.GJ27357@dell>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lee Jones <lee.jones@linaro.org>, Peter Griffin <peter.griffin@linaro.org>
Cc: ohad@wizery.com, devicetree@vger.kernel.org, kernel@stlinux.com, vinod.koul@intel.com, linux-remoteproc@vger.kernel.org, patrice.chotard@st.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, airlied@linux.ie, kraxel@redhat.com, dmaengine@vger.kernel.org, dan.j.williams@intel.com, bjorn.andersson@linaro.org, virtualization@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello ptere, Lee,

Thanks for your remarks,

Regards
Arnaud
On 08/31/2016 01:28 PM, Lee Jones wrote:
> On Tue, 30 Aug 2016, Peter Griffin wrote:
>> Thanks for reviewing and your very valuable feedback.
>> On Tue, 30 Aug 2016, Lee Jones wrote:
>>> On Fri, 26 Aug 2016, Peter Griffin wrote:
>>>
>>>> This patch adds the DT node for the uniperif reader
>>>> IP block found on STiH407 family silicon.
>>>>
>>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
>>>> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
>>>> ---
>>>>  arch/arm/boot/dts/stih407-family.dtsi | 26 ++++++++++++++++++++++++++
>>>>  1 file changed, 26 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
>>>> index d263c96..bdddf2c 100644
>>>> --- a/arch/arm/boot/dts/stih407-family.dtsi
>>>> +++ b/arch/arm/boot/dts/stih407-family.dtsi
>>>> @@ -956,5 +956,31 @@
>>>>  			st,version = <5>;
>>>>  			st,mode = "SPDIF";
>>>>  		};
>>>> +
>>>> +		sti_uni_reader0: sti-uni-reader@0 {
>>>> +			compatible = "st,sti-uni-reader";
>>>> +			status = "disabled";
>>>
>>> I find it's normally nicer to place the status of the node at the
>>> bottom, separated by a '\n'.
>>
>> Ok I'll add a superflous '\n' in the next version.
> 
> Everyone loves a smart arse!
> 
> In this case I believe the '\n' to be a functional separator and not
> superfluous at all.
> 
>>>> +			dai-name = "Uni Reader #0 (PCM IN)";
>>>
>>> Oooo, not seen something like this before.
>>>
>>> If it does not already have one, it would require a DT Ack.
>>
>> No idea, the driver got merged 1 year ago.
This field could be suppressed and handled in source code, using
st,uniperiph-id to retreive it.
>>
>> Arnaud did you get a DT ack when you merged this driver & binding? i if i remember well, i had  sent to Alsa mailing list only, I missed
this obvious...
>>>
>>>> +			st,version = <3>;
>>>
>>> This will likely need a DT Ack too.  We usually encode this sort of
>>> information in the compatible string.
yes, better to use compatibility
>>
>> See 05c1b4480e86a871b18030d6f3d532dc0ecdf38c
> 
> Well Rob's the boss.  We certainly never used to take 'device ID' or
> 'version' attributes.  I guess something must have changed.

I will try to provide patches for code and bindings rework this week.

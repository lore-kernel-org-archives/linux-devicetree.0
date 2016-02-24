From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH] arm64: dts: msm8916: Move smem below hwlock
Date: Wed, 24 Feb 2016 12:31:48 +0200
Message-ID: <56CD8694.1070009@linaro.org>
References: <1456248071-30547-1-git-send-email-georgi.djakov@linaro.org>
 <56CC970B.4080602@linaro.org> <56CCA95C.9070207@linaro.org>
 <20160223190356.GA17346@hector.attlocal.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160223190356.GA17346@hector.attlocal.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org

On 02/23/2016 09:03 PM, Andy Gross wrote:
> On Tue, Feb 23, 2016 at 08:47:56PM +0200, Georgi Djakov wrote:
>> On 23.02.16 =D0=B3. 19:29, Srinivas Kandagatla wrote:
>>>
>>>
>>> On 23/02/16 17:21, Georgi Djakov wrote:
>>>> When the SMEM is probed it defers as it depends on the hardware lo=
ck, which
>>>> is not available yet. But the SMD bus and RPM regulators and clock=
s depend
>>>> on SMEM and they defer too. The problem with this is that the orde=
r of
>>>> registering the devices is not optimal and also we may end with me=
ssed
>>>> up serial console as the RPM clocks are not registered yet..
>>> I noticed the same issue but was wondering why would we end up with=
 messed up serial console?
>>>
>>> Could you add more details on why serial console is messed up?
>>>
>>> I thought, serial driver has nothing to do with the rpm clocks dire=
ctly!
>>>
>>
>> If we don't have the rpm clocks registered, the uart clock is an orp=
han
>> and when clk_get_rate() is called on orphan clocks it returns 0 as r=
ate.
>> In our case the msm_serial driver calls clk_get_rate() and gets 0 ra=
te
>> as the parent rpm clock has not registered yet. The result is that t=
he
>> baudrate is set incorrectly.
>=20
> This isn't a probe defer issue w/ the SMEM and hwspinlock.  That work=
s properly.

Ok, agree.

> This is an issue with the msm_serial either not probe deferring to wa=
it for the
> rpm clocks or not handling the case of the clk framework giving us a =
'bogus'
> clock.  Can we queue off the clk_get_rate being 0 to probe defer for =
the rpm
> clocks? (although that is hacky).

The proper solution would be to handle this in the clock framework.

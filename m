From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH] arm64: dts: msm8916: Move smem below hwlock
Date: Tue, 23 Feb 2016 22:18:35 +0200
Message-ID: <56CCBE9B.5010209@linaro.org>
References: <1456248071-30547-1-git-send-email-georgi.djakov@linaro.org>
 <56CC970B.4080602@linaro.org> <56CCA95C.9070207@linaro.org>
 <56CCB2E3.9050309@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <56CCB2E3.9050309@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, andy.gross@linaro.org
Cc: Georgi Djakov <georgi.djakov@linaro.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 23.02.16 =D0=B3. 21:28, Srinivas Kandagatla wrote:
>=20
>=20
> On 23/02/16 18:47, Georgi Djakov wrote:
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
> Shouldn't the actual uart clk provider registration fail/defer probe =
due to missing parent in this case?
>=20

Yes, this is a known issue and people are currently working on it.
http://www.spinics.net/lists/linux-clk/msg00065.html
http://www.spinics.net/lists/arm-kernel/msg475910.html

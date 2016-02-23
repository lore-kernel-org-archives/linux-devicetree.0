From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] arm64: dts: msm8916: Move smem below hwlock
Date: Tue, 23 Feb 2016 19:28:35 +0000
Message-ID: <56CCB2E3.9050309@linaro.org>
References: <1456248071-30547-1-git-send-email-georgi.djakov@linaro.org>
 <56CC970B.4080602@linaro.org> <56CCA95C.9070207@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56CCA95C.9070207@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>, andy.gross@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 23/02/16 18:47, Georgi Djakov wrote:
> On 23.02.16 =D0=B3. 19:29, Srinivas Kandagatla wrote:
>>
>>
>> On 23/02/16 17:21, Georgi Djakov wrote:
>>> When the SMEM is probed it defers as it depends on the hardware loc=
k, which
>>> is not available yet. But the SMD bus and RPM regulators and clocks=
 depend
>>> on SMEM and they defer too. The problem with this is that the order=
 of
>>> registering the devices is not optimal and also we may end with mes=
sed
>>> up serial console as the RPM clocks are not registered yet..
>> I noticed the same issue but was wondering why would we end up with =
messed up serial console?
>>
>> Could you add more details on why serial console is messed up?
>>
>> I thought, serial driver has nothing to do with the rpm clocks direc=
tly!
>>
>
> If we don't have the rpm clocks registered, the uart clock is an orph=
an
> and when clk_get_rate() is called on orphan clocks it returns 0 as ra=
te.
Shouldn't the actual uart clk provider registration fail/defer probe du=
e=20
to missing parent in this case?

--srini
> In our case the msm_serial driver calls clk_get_rate() and gets 0 rat=
e
> as the parent rpm clock has not registered yet. The result is that th=
e
> baudrate is set incorrectly.
>
> BR,
> Georgi
>

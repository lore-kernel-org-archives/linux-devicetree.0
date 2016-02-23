From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH] arm64: dts: msm8916: Move smem below hwlock
Date: Tue, 23 Feb 2016 20:47:56 +0200
Message-ID: <56CCA95C.9070207@linaro.org>
References: <1456248071-30547-1-git-send-email-georgi.djakov@linaro.org>
 <56CC970B.4080602@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <56CC970B.4080602@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, andy.gross@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 23.02.16 =D0=B3. 19:29, Srinivas Kandagatla wrote:
>=20
>=20
> On 23/02/16 17:21, Georgi Djakov wrote:
>> When the SMEM is probed it defers as it depends on the hardware lock=
, which
>> is not available yet. But the SMD bus and RPM regulators and clocks =
depend
>> on SMEM and they defer too. The problem with this is that the order =
of
>> registering the devices is not optimal and also we may end with mess=
ed
>> up serial console as the RPM clocks are not registered yet..
> I noticed the same issue but was wondering why would we end up with m=
essed up serial console?
>=20
> Could you add more details on why serial console is messed up?
>=20
> I thought, serial driver has nothing to do with the rpm clocks direct=
ly!
>=20

If we don't have the rpm clocks registered, the uart clock is an orphan
and when clk_get_rate() is called on orphan clocks it returns 0 as rate=
=2E
In our case the msm_serial driver calls clk_get_rate() and gets 0 rate
as the parent rpm clock has not registered yet. The result is that the
baudrate is set incorrectly.

BR,
Georgi

From: Srinivas KANDAGATLA <srinivas.kandagatla@st.com>
Subject: Re: [PATCH v6] clocksource:arm_global_timer: Add ARM global timer
 support.
Date: Wed, 26 Jun 2013 10:17:01 +0100
Message-ID: <51CAB18D.1010906@st.com>
References: <1372152678-29530-1-git-send-email-srinivas.kandagatla@st.com> <96d7573f-0991-4bda-8f4e-d1f36b743f95@VA3EHSMHS021.ehs.local>
Reply-To: srinivas.kandagatla@st.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <96d7573f-0991-4bda-8f4e-d1f36b743f95@VA3EHSMHS021.ehs.local>
Sender: linux-doc-owner@vger.kernel.org
To: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann@xilinx.com>
Cc: John Stultz <john.stultz@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Stuart Menefy <stuart.menefy@st.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robherring2@gmail.com>, Will Deacon <will.deacon@arm.com>
List-Id: devicetree@vger.kernel.org

Thanks for your comments,
On 25/06/13 22:14, S=C3=B6ren Brinkmann wrote:
>> +Example:
>> > +
>> > +	timer@2c000600 {
>> > +		compatible =3D "arm,cortex-a9-global-timer";
>> > +		reg =3D <0x2c000600 0x20>;
>> > +		interrupts =3D <1 13 0xf01>;
>> > +	};
> Isn't a 'clocks' entry missing here?
Yep, I will add it in v7.

Thanks,
srini


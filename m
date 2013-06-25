From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/2] Make non-linear GPIO ranges accesible from gpiolib
Date: Tue, 25 Jun 2013 09:19:17 -0600
Message-ID: <51C9B4F5.6070008@wwwdotorg.org>
References: <CACRpkdY9F0cUaRfGJnHJW=2dYf_yKkr3M8Kh+_e6XQhh1WBoUA@mail.gmail.com> <1371128132-18266-2-git-send-email-christian.ruppert@abilis.com> <51BA3BC1.3090109@wwwdotorg.org> <20130614091241.GA23745@ab42.lan> <51C1F42E.5090107@wwwdotorg.org> <51C1F82C.4020502@wwwdotorg.org> <20130620115710.GB942@ab42.lan> <51C4C2ED.5090505@wwwdotorg.org> <CACRpkdbnXmJnPd6akeEVuU9dwAe+FOvm6boDt8=zjG_D3ZLTGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbnXmJnPd6akeEVuU9dwAe+FOvm6boDt8=zjG_D3ZLTGg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Christian Ruppert <christian.ruppert@abilis.com>, Patrice CHOTARD <patrice.chotard@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Sascha Leuenberger <sascha.leuenberger@abilis.com>, Pierrick Hascoet <pierrick.hascoet@abilis.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
List-Id: devicetree@vger.kernel.org

On 06/25/2013 08:27 AM, Linus Walleij wrote:
> On Fri, Jun 21, 2013 at 11:17 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> 
>> When I pushed for the concept of groups, I intended it to mean precisely
>> one single thing. The points below describe this.
>>
>> 1) A pin is a single pin/ball/pad on the package.
>>
>> 2) Some register fields affect just a single pin. For example, there may
>> be a register field that affects pin A8's mux setting only.
>>
>> 3) Some register fields affect multiple pins at once. For example,
>> perhaps one register field affects both pin A8's an pin A7's mux setting
>> at once.
>>
>> 4) Depending on HW design, all register fields might be of type
>> described at (2) above, or all of the type described at (3) above, or a
>> mixture of both. Tegra is a mixture.
>>
>> 5) I expect the concept of a pin group to solely represent the various
>> groups of pins affected by each register field; in (2) above one pin per
>> group, in (3) above many pins per group.
>>
>> Thus, to my mind, a pin group is purely a HW concept, and dictated
>> purely by HW design.
> 
> This we can discuss perpetually it seems.
> 
> For Nomadik, as I've pointed out in the past it is actually:
> 
> (6): it is one register/set if bits per pin, BUT the register settings
>  pertain to physical lines having electrical settings which postulate
>  that they be handled in batch or wreak havoc.
> 
> I.e. it is a HW limitation in the *silicon* of *all* implementations,
> but that is *not* expressed in the register map.
> 
> For the practical consequences see __nmk_config_pins if (glitch)
> runpath. Handling this as a group makes perfect sense from
> a hardware point of view.

OK, so there are certainly some HW designs that may benefit from using
groups even where the registers are per-pin. Using them there makes sense.

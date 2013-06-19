From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/2] Make non-linear GPIO ranges accesible from gpiolib
Date: Wed, 19 Jun 2013 12:10:54 -0600
Message-ID: <51C1F42E.5090107@wwwdotorg.org>
References: <CACRpkdY9F0cUaRfGJnHJW=2dYf_yKkr3M8Kh+_e6XQhh1WBoUA@mail.gmail.com> <1371128132-18266-2-git-send-email-christian.ruppert@abilis.com> <51BA3BC1.3090109@wwwdotorg.org> <20130614091241.GA23745@ab42.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20130614091241.GA23745@ab42.lan>
Sender: linux-doc-owner@vger.kernel.org
To: Christian Ruppert <christian.ruppert@abilis.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Patrice CHOTARD <patrice.chotard@st.com>, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Sascha Leuenberger <sascha.leuenberger@abilis.com>, Pierrick Hascoet <pierrick.hascoet@abilis.com>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
List-Id: devicetree@vger.kernel.org

On 06/14/2013 03:12 AM, Christian Ruppert wrote:
> On Thu, Jun 13, 2013 at 03:38:09PM -0600, Stephen Warren wrote:
>> On 06/13/2013 06:55 AM, Christian Ruppert wrote:
>>> This patch adds the infrastructure required to register non-linear gpio
>>> ranges through gpiolib and the standard GPIO device tree bindings.
>>
>> That's not exactly true. The existing gpio-ranges property already
>> allows non-linear ranges to be represented quite easily; each entry in
>> the gpio-ranges list is <gpio-base> <pinctrl-base> <count>, so you can
>> piece together any mapping you want.
> 
> You're right, my description is somewhat imprecise here.
> 
>> The potential advantage of this patch is that the pinctrl-side of the
>> mapping can be a group name rather than pin IDs, which might reduce the
>> size of the mapping list if you have an extremely sparse or non-linear
>> mapping /and/ parts of that mapping just happen to align with the pin
>> groups in the pin controller HW, since each entry in the gpio-ranges
>> property can be sparse/non-linear, rather than being a small linear
>> chunk of the mapping.
> 
> Pin controller authors have the freedom to define pin groups just for
> the purpose of "predefining" the pinctrl side of GPIO ranges.

Hmm. I suppose that's true. I'm not sure how enthusiastic I am about
doing this though... The reason I'm unsure is because it starts using
pin groups from something other than groups of pins in HW that are all
affected by the same mux or config bits in a register, and starts using
pin groups for something else; GPIO<->pinmux pins mapping. Perhaps it's
OK though, considering the other abuses of pin groups that are already
present, such as using pin groups to represent default/common uses of
groups of pins that don't actually exist in HW.

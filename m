From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/2] pinmux: Add TB10x pinmux driver
Date: Wed, 08 May 2013 14:01:53 -0600
Message-ID: <518AAF31.8080502@wwwdotorg.org>
References: <1365608728-30494-1-git-send-email-christian.ruppert@abilis.com> <516EEAA0.10906@wwwdotorg.org> <20130418090310.GA17636@ab42.lan> <CACRpkdZd0_W432od5565phhUcJMRWiV9vXX4QVF4osKkxstC0Q@mail.gmail.com> <20130429161725.GB30136@ab42.lan> <5182B557.4040804@wwwdotorg.org> <CACRpkdaxO0q_P2wJFy3zv4F-QM9dZk54qW8ft350XqcBt1Gr1w@mail.gmail.com> <20130508164123.GA10248@ab42.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20130508164123.GA10248@ab42.lan>
Sender: linux-doc-owner@vger.kernel.org
To: Christian Ruppert <christian.ruppert@abilis.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Patrice CHOTARD <patrice.chotard@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Sascha Leuenberger <sascha.leuenberger@abilis.com>, Pierrick Hascoet <pierrick.hascoet@abilis.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 05/08/2013 10:41 AM, Christian Ruppert wrote:
...
> What do you think about the following modification to the pinctrl/GPIO
> frameworks instead (not yet a formal patch, more a request for comment
> to illustrate what I mean. If you agree, I will clean it up and submit a
> proper patch after discussion).
> 
> It adds a dt_gpiorange_xlate function to the pinctrl callbacks which
> defaults to the conventional behaviour using kernel logical pin numbers.
> However, pin controllers which provide more complex mechanisms can
> define #gpio-range-cells and provide this callback in order to keep
> Linux pin numbering inside the kernel.

Can you provide an example of the DT content, and explain exactly what
this patch does with it; what effect it has on the existing GPIO or
pinctrl code?

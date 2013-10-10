From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 01/03] Make non-linear GPIO ranges accesible from gpiolib
Date: Thu, 10 Oct 2013 14:49:13 -0600
Message-ID: <525712C9.6040502@wwwdotorg.org>
References: <20131008122145.GA21985@ab42.lan>	<1381235122-23730-1-git-send-email-christian.ruppert@abilis.com>	<CACRpkdafaNE_fgiq8iW=_gT5gDVC_H8m-+0dfpunhAantLdJwQ@mail.gmail.com>	<20131009132837.GA23021@ab42.lan> <CACRpkdbo9MOuCY_UWhzbWwEAom_Z3=Vi575ELix9j3hsZdBzZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbo9MOuCY_UWhzbWwEAom_Z3=Vi575ELix9j3hsZdBzZw@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Christian Ruppert <christian.ruppert@abilis.com>
Cc: Patrice CHOTARD <patrice.chotard@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Sascha Leuenberger <sascha.leuenberger@abilis.com>, Pierrick Hascoet <pierrick.hascoet@abilis.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 10/09/2013 08:01 AM, Linus Walleij wrote:
> On Wed, Oct 9, 2013 at 3:28 PM, Christian Ruppert
> <christian.ruppert@abilis.com> wrote:
>> On Wed, Oct 09, 2013 at 01:58:35PM +0200, Linus Walleij wrote:
>>> On Tue, Oct 8, 2013 at 2:25 PM, Christian Ruppert
>>> <christian.ruppert@abilis.com> wrote:
...
>> Obviously, a driver (no matter for which OS) must be aware of
>> this hardware property so it can decide which value to write to which
>> register in order to control the pin mux. If we don't want to split (or
>> worse: duplicate) that information in the driver and device tree, I see
>> two alternatives.
>> 1. Define register offsets, masks and register values and the list of
>>    pins controlled by those register/value pairs in the device tree.
> 
> This is not a viable alternative of course.

Cough. pinctrl-single. Cough.

From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jun 27 (pinctrl && !CONFIG_OF)
Date: Mon, 4 Jul 2016 09:12:25 -0700
Message-ID: <577A8AE9.3010807@infradead.org>
References: <20160627163939.20e454d5@canb.auug.org.au>
 <57716D3D.4070302@infradead.org>
 <CACRpkdb2a=7QhW5A7yucC-DPo4NmNNcd3NcOznVtk0+8XMtbHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdb2a=7QhW5A7yucC-DPo4NmNNcd3NcOznVtk0+8XMtbHA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>
List-Id: devicetree@vger.kernel.org

On 07/04/16 02:46, Linus Walleij wrote:
> On Mon, Jun 27, 2016 at 8:15 PM, Randy Dunlap <rdunlap@infradead.org> wrote:
> 
>> On 06/26/16 23:39, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20160624:
>>>
>>
>> on i386, when CONFIG_OF is not enabled ...
>> but OF_GPIO is enabled due to this in drivers/gpio/Kconfig:
>>
>> config OF_GPIO
>>         def_bool y
>>         depends on OF || COMPILE_TEST
>>
>> (above from commit 1e4a80640338924b9f9fd7a121ac31d08134410a
>> from Alexander Stein <alexanders83@web.de>)
>>
>>
>> ../drivers/pinctrl/bcm/pinctrl-iproc-gpio.c:381:20: error: 'pinconf_generic_dt_node_to_map_pin' undeclared here (not in a function)
>> ../drivers/pinctrl/bcm/pinctrl-cygnus-mux.c:739:20: error: 'pinconf_generic_dt_node_to_map_group' undeclared here (not in a function)
>> ../drivers/pinctrl/bcm/pinctrl-nsp-gpio.c:365:20: error: 'pinconf_generic_dt_node_to_map_pin' undeclared here (not in a function)
>>
>> because that function is only present when CONFIG_OF is enabled.
>>
>>
>> Also, why does that commit (1e4a80640338924b9f9fd7a121ac31d08134410a)
>> not have any other S-O-B lines in it?  like whoever merged it?
> 
> I merged it I think, Alex made a long series enabling compile
> testing and I started to cherry-pick the first commits to let
> them trickle in.

I guess that when you do a git pull of a series of patches, you
sign the pull commit but not each patch in the series?
That could explain it.

> I was worried about it because some of the patches caused
> severe build problems on some archs.
> 
> It's a  bit tricky to know what to do here: we want compile
> coverage to get proper testing, when we turn it on we get regressions,
> so trying to improve things make things break and it becomes a
> vicious circle of trouble. I don't know what the biggest pain is ...
> 
> I don't really see the conclusion of this discussion thread, whether
> I should revert the patch or not? For fixes or next?

I agree with Arnd that this particular commit should be reverted
(1e4a80640338924b9f9fd7a121ac31d08134410a).


-- 
~Randy

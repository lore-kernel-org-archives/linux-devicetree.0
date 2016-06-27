From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jun 27 (pinctrl && !CONFIG_OF)
Date: Mon, 27 Jun 2016 11:15:25 -0700
Message-ID: <57716D3D.4070302@infradead.org>
References: <20160627163939.20e454d5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160627163939.20e454d5@canb.auug.org.au>
Sender: linux-gpio-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>
List-Id: devicetree@vger.kernel.org

On 06/26/16 23:39, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20160624:
> 

on i386, when CONFIG_OF is not enabled ...
but OF_GPIO is enabled due to this in drivers/gpio/Kconfig:

config OF_GPIO
	def_bool y
	depends on OF || COMPILE_TEST

(above from commit 1e4a80640338924b9f9fd7a121ac31d08134410a
from Alexander Stein <alexanders83@web.de>)


../drivers/pinctrl/bcm/pinctrl-iproc-gpio.c:381:20: error: 'pinconf_generic_dt_node_to_map_pin' undeclared here (not in a function)
../drivers/pinctrl/bcm/pinctrl-cygnus-mux.c:739:20: error: 'pinconf_generic_dt_node_to_map_group' undeclared here (not in a function)
../drivers/pinctrl/bcm/pinctrl-nsp-gpio.c:365:20: error: 'pinconf_generic_dt_node_to_map_pin' undeclared here (not in a function)

because that function is only present when CONFIG_OF is enabled.


Also, why does that commit (1e4a80640338924b9f9fd7a121ac31d08134410a)
not have any other S-O-B lines in it?  like whoever merged it?


-- 
~Randy

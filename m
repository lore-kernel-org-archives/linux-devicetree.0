From: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH 04/14] OF: pinctrl: MIPS: lantiq: implement lantiq/xway
 pinctrl support
Date: Tue, 08 May 2012 17:59:33 +0200
Message-ID: <4FA942E5.20906@phrozen.org>
References: <1336133919-26525-1-git-send-email-blogic@openwrt.org>
 <1336133919-26525-4-git-send-email-blogic@openwrt.org>
 <CACRpkdYJDd84GbKM7r4Xy+d4iOtdD+rJ3kdq-zwVbf_Attj2Gw@mail.gmail.com>
 <4FA93B97.4070406@wwwdotorg.org> <4FA93E37.70305@phrozen.org>
 <4FA940F3.4090008@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4FA940F3.4090008-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


>> How about we do the following.
>>
>> config LANTIQ
>> 	select PINCTRL
>>
>> config PINCTRL_LANTIQ
>> 	def_bool y
>> 	depends on LANTIQ
>>
>> config PINCTRL_LANTIQ_XWAY
>> 	def_bool y
>> 	depends on SOC_TYPE_XWAY
>>
>> This would auto select the right symbols, have all the dependency logic
>> in 1 place and reduce the size of arch/mips/lantiq/Kconfig
> 
> Is it useful to build a kernel for XWAY without pinctrl, once the driver
> is there? That's the main difference between arch/mips/lantiq/Kconfig
> selecting PINCTRL_LANTIQ_XWAY vs that being a def_bool, and hence
> allowing the user to deselect it.
> 

it would not make sense to build an image without.

config LANTIQ and config SOC_TYPE_XWAY should explicitly select the
symbols that they need.

From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Subject: Re: [PATCH] arm: dts: sun7i: include correct ccu clock header
Date: Thu, 1 Feb 2018 16:37:53 +0100
Message-ID: <3ae29cfa-a87e-c8da-60a7-4f8792fe52cf@micronovasrl.com>
References: <1517427086-66480-1-git-send-email-giulio.benetti@micronovasrl.com>
 <20180201151900.2zabioxbq7iehl4v@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180201151900.2zabioxbq7iehl4v@flea.lan>
Content-Language: it
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Il 01/02/2018 16:19, Maxime Ripard ha scritto:
> Hi,
> 
> On Wed, Jan 31, 2018 at 08:31:26PM +0100, Giulio Benetti wrote:
>> Include correct clock header sun7i-a20-ccu.h
>> instead of sun4i-a20-ccu.h.
> 
> You should wrap at 72 characters.

Ok, keep in mind for next patches. Thanks

> 
>> Including sun4i header instead of sun7i
>> prevents using sun7i specific defines.
>>
>> Substitute header inclusion in sun7i-a20.dtsi
>> using right one.
> 
> This sentence is redundant with the first one.

Yes, you're right. Thanks

> 
> Dropped the first one, corrected the wrapping and applied, thanks
> 
> Maxime
> 


-- 
Giulio Benetti
R&D Manager &
Advanced Research

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale € 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642

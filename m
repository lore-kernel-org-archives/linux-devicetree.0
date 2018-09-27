From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Subject: Re: [PATCH 0/5] Add CDTech 4.3" and 7" to panel-simple
Date: Thu, 27 Sep 2018 15:08:32 +0200
Message-ID: <88156978-a46e-7879-239f-0df289658641@micronovasrl.com>
References: <20180730231117.5631-1-giulio.benetti@micronovasrl.com>
 <20180927115938.GD29102@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180927115938.GD29102@ulmo>
Content-Language: it
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Thierry,

Il 27/09/2018 13:59, Thierry Reding ha scritto:
> On Tue, Jul 31, 2018 at 01:11:12AM +0200, Giulio Benetti wrote:
>> Add CDTech 4.3" S043WQ26H-CT7 support
>> Add CDTech 7" S070WV95-CT16 support
>>
>> Giulio Benetti (5):
>>    dt-bindings: Add vendor prefix for CDTech(H.K.) Electronics Limited
>>    drm/panel: add panel CDTech S070WV95-CT16 to panel-simple
>>    dt-bindings: Add CDTech S070WV95-CT16 panel bindings
>>    drm/panel: add panel CDTech S043WQ26H-CT7 to panel-simple
>>    dt-bindings: Add CDTech S043WQ26H-CT7 panel bindings
>>
>>   .../display/panel/cdtech,s043wq26h-ct7.txt    | 12 ++++
>>   .../display/panel/cdtech,s070wv95-ct16.txt    | 12 ++++
>>   .../devicetree/bindings/vendor-prefixes.txt   |  1 +
>>   drivers/gpu/drm/panel/panel-simple.c          | 55 +++++++++++++++++++
>>   4 files changed, 80 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/display/panel/cdtech,s043wq26h-ct7.txt
>>   create mode 100644 Documentation/devicetree/bindings/display/panel/cdtech,s070wv95-ct16.txt
> 
> All applied, thanks. One small note, though: in the future please send
> DT bindings patches before the driver patches. This is important because
> checkpatch, which is run as pre-commit script, warns about undocumented
> compatible strings if you send driver changes before the bindings.

Ok, thanks for both applying and pointing me this important detail.

-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale € 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642

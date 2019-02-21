From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2] dt-bindings: hwmon: Add missing documentation for lm75
Date: Thu, 21 Feb 2019 06:02:01 -0800
Message-ID: <59969c88-585c-cb7d-3104-8059b78ed2e3@roeck-us.net>
References: <20190212113808.3040-1-jagan@amarulasolutions.com>
 <CAMty3ZBaOZoj+xV+e+4BtYdaWA2biwENmngOa9vbbMB=_vbB1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMty3ZBaOZoj+xV+e+4BtYdaWA2biwENmngOa9vbbMB=_vbB1w@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>, Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-hwmon@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 2/20/19 9:22 AM, Jagan Teki wrote:
> On Tue, Feb 12, 2019 at 5:08 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>>
>> Add missing dt-binding documentation for lm75 hwmon sensor.
>>
>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>> ---
>> Changes for v2:
>> -  Add all compatible nodes available in lm75.
>>
>>   .../devicetree/bindings/hwmon/lm75.txt        | 37 +++++++++++++++++++
>>   1 file changed, 37 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/hwmon/lm75.txt
> 
> Any comments on this? It is blocking some dts changes to get merge
> into Mainline.
> 

Waiting for Rob's Ack.

Guenter

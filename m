From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 00/14] arm64: dts: meson: fixes following YAML bindings
 schemas conversion
Date: Fri, 23 Aug 2019 08:53:42 +0200
Message-ID: <2fd4a768-f167-715e-7e77-df45c20a6487@baylibre.com>
References: <20190821142043.14649-1-narmstrong@baylibre.com>
 <7h36hs3khb.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7h36hs3khb.fsf@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 23/08/2019 00:26, Kevin Hilman wrote:
> Neil Armstrong <narmstrong@baylibre.com> writes:
> 
>> This is the first set of DT fixes following the first YAML bindings conversion
>> at [1], [2] and [3].
>>
>> After this set of fixes, the remaining errors are :
>> meson-axg-s400.dt.yaml: sound: 'clocks' is a dependency of 'assigned-clocks'
>> meson-g12a-sei510.dt.yaml: sound: 'clocks' is a dependency of 'assigned-clocks'
>> meson-g12b-odroid-n2.dt.yaml: usb-hub: gpios:0:0: 20 is not valid under any of the given schemas
>> meson-g12b-odroid-n2.dt.yaml: sound: 'clocks' is a dependency of 'assigned-clocks'
>> meson-g12a-x96-max.dt.yaml: sound: 'clocks' is a dependency of 'assigned-clocks'
>>
>> These are only cosmetic changes, and should not break drivers implementation
>> following the bindings.
> 
> Any chance you can rebase this on top of my v5.4/dt64 branch?

Sure, will resend today.

Neil

> 
> Thanks,
> 
> Kevin
> 

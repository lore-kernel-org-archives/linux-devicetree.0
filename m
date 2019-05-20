From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: amlogic: Move 'amlogic,meson-gx-ao-secure' binding to its own file
Date: Mon, 20 May 2019 10:10:21 -0700
Message-ID: <7hmujh832a.fsf@baylibre.com>
References: <draft-7hsgt9842a.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <draft-7hsgt9842a.fsf@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Carlo Caione <carlo@caione.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Kevin Hilman <khilman@baylibre.com> writes:

> Rob Herring <robh@kernel.org> writes:
>
>> It is best practice to have 1 binding per file, so board level bindings
>> should be separate for various misc SoC bindings.
>>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Carlo Caione <carlo@caione.org>
>> Cc: Kevin Hilman <khilman@baylibre.com>
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-amlogic@lists.infradead.org
>> Signed-off-by: Rob Herring <robh@kernel.org>
>> ---
>> It seems this one fell thru the cracks and didn't get applied.
>
> Feel free to apply directly.
>
> Acked-by: Kevin Hilman <khilman@baylibre.com>

On second that, we're going to have dependencies on that for the v5.3
cycle, so I'll queue these up.

Kevin

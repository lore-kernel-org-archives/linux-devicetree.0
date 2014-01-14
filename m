From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 0/3] power_supply: modelgauge_battery: Add Maxim ModelGauge
 ICs gauge
Date: Tue, 14 Jan 2014 16:59:42 +0100
Message-ID: <52D55EEE.3060502@samsung.com>
References: <1389286145-15375-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1389286145-15375-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/09/2014 05:49 PM, Vladimir Barinov wrote:
> This adds the folowing:
> - Maxim ModelGauge ICs gauge driver for MAX17040/41/43/44/48/49/58/59 chips
> - Document DT bindings
> - Remove superseded Maxim MAX17040 gauge driver
>
> Vladimir Barinov (3):
>   [1/3] power_supply: modelgauge_battery: Maxim ModelGauge ICs gauge
>   [2/3] dt: Document ModelGauge gauge bindings
>   [3/3] power_supply: modelgauge_battery: Remove Maxim MAX17040 gauge

On which tree your patchset is based on? I had conflicts when trying to 
apply this on 3.12 and 3.13.

Best regards,
Krzysztof

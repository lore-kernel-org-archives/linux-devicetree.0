From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: net: dsa: qca8k: fix example
Date: Wed, 20 Mar 2019 11:03:25 -0700
Message-ID: <e1bf7f80-ab2a-9bee-66f4-90e959193173@gmail.com>
References: <20190319195419.12746-1-chunkeey@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190319195419.12746-1-chunkeey@gmail.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Christian Lamparter <chunkeey@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: Vivien Didelot <vivien.didelot@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On 3/19/19 12:54 PM, Christian Lamparter wrote:
> In the example, the phy at phy@0 is clashing with
> the switch0@0 at the same address. Usually, the switches
> are accessible through pseudo PHYs which in case of the
> qca8k are located at 0x10 - 0x18.
> 
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

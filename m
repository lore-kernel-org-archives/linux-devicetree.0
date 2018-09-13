Return-Path: <timur@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: net: qcom: Add binding for shared mdio
 bus
References: <1536829493-10088-1-git-send-email-dongsheng.wang@hxt-semitech.com>
 <1536829493-10088-2-git-send-email-dongsheng.wang@hxt-semitech.com>
From: Timur Tabi <timur@kernel.org>
Message-ID: <8b593839-2e81-e4d1-6574-5c4f66cf7b9c@kernel.org>
Date: Thu, 13 Sep 2018 10:02:41 -0500
MIME-Version: 1.0
In-Reply-To: <1536829493-10088-2-git-send-email-dongsheng.wang@hxt-semitech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Wang Dongsheng <dongsheng.wang@hxt-semitech.com>
Cc: davem@davemloft.net, yu.zheng@hxt-semitech.com, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
List-ID: <devicetree@vger.kernel.org>

On 9/13/18 4:04 AM, Wang Dongsheng wrote:
> This property copy from "ibm,emac.txt" to describe a shared MIDO bus.
> Since QDF2400 emac include MDIO, so If the motherboard has more than one
> PHY connected to an MDIO bus, this property will point to the MAC device
> that has the MDIO bus.
> 
> Signed-off-by: Wang Dongsheng<dongsheng.wang@hxt-semitech.com>

The QDF2400 does not support device trees, so please don't talk about DT 
support in the context of the QDF2400.

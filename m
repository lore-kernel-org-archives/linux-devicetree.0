From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v3 1/2] ARM: dts: Add expansion bus to VExpress
Date: Fri, 15 Apr 2016 09:55:50 +0100
Message-ID: <5710AC96.2020108@arm.com>
References: <1460648359-7310-1-git-send-email-brian.starkey@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460648359-7310-1-git-send-email-brian.starkey@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Starkey <brian.starkey@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 14/04/16 16:39, Brian Starkey wrote:
> The VExpress development platform has an external expansion bus which
> can be used for additional hardware (e.g. LogicTile Express
> daughterboards).
> Add this bus to the VExpress CoreTile device-trees.
>
> The bus is described for a CoreTile occupying site 1.
>

Pulled both, thanks for splitting.

-- 
Regards,
Sudeep

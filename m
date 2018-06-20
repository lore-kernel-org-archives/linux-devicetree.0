Return-Path: <SRS0=5+Be=JG=zonque.org=daniel@kernel.org>
Subject: Re: [PATCH v2 2/5] leds: lt3593: merge functions and clean up code
References: <20180618194301.5667-1-daniel@zonque.org>
 <20180618194301.5667-3-daniel@zonque.org>
 <4ec8a468-c7c0-d4bc-7b20-0a2b502c22e8@gmail.com>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <11c1deb1-7276-379a-5253-2c007125c7f9@zonque.org>
Date: Wed, 20 Jun 2018 22:12:23 +0200
MIME-Version: 1.0
In-Reply-To: <4ec8a468-c7c0-d4bc-7b20-0a2b502c22e8@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, robh+dt@kernel.org
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Jacek,

On Wednesday, June 20, 2018 09:41 PM, Jacek Anaszewski wrote:
> This patch doesn't apply cleanly.
> Could you please double check if it applies to LED tree
> on your side? Below is the conflict as reported by > git am --3way.

Oops, sorry. My series was based on 4.17. I'll rebase to 4.18-rc1 and 
resend.


Thanks,
Daniel

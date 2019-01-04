From: Rodolfo Giometti <giometti@enneenne.com>
Subject: Re: [PATCH v14 2/3] dt-bindings: pps: pps-gpio PPS ECHO
 implementation
Date: Fri, 4 Jan 2019 18:08:00 +0100
Message-ID: <e23a0bfc-ab47-bdc1-7d32-d04ea5a250fd@enneenne.com>
References: <20181230083333.27210-1-tom@aussec.com>
 <20181230083333.27210-2-tom@aussec.com>
 <20181230083333.27210-3-tom@aussec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181230083333.27210-3-tom@aussec.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Tom Burkart <tom@aussec.com>, Linux kernel mailing list <linux-kernel@vger.kernel.org>
Cc: devicetree@vger.kernel.org, Ricardo Martins <rasm@fe.up.pt>, James Nuss <jamesnuss@nanometrics.ca>, Lukas Senger <lukas@fridolin.com>
List-Id: devicetree@vger.kernel.org

On 30/12/2018 09:33, Tom Burkart wrote:
> This patch implements the device tree binding changes required for the
> pps echo functionality for pps-gpio, that sysfs claims is available
> already.
> 
> This patch was originally written by Lukas Senger as part of a masters
> thesis project and modified for inclusion into the linux kernel by Tom
> Burkart.

I think this patch it's OK but I'm asking to myself if it should be merged with 
next one... logically it describes what patch 3/3 does so why do we keep them 
separated?

Ciao,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming                     skype:  rodolfo.giometti

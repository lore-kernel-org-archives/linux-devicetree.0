Return-Path: <SRS0=NzkR=JS=zonque.org=daniel@kernel.org>
Subject: Re: [PATCH v2 0/4] input: touchscreen: eeti: DT bindings and
 clean-ups
References: <20180623154533.26901-1-daniel@zonque.org>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <e32434be-cb77-e00b-15d6-aa8592399560@zonque.org>
Date: Mon, 2 Jul 2018 09:55:25 +0200
MIME-Version: 1.0
In-Reply-To: <20180623154533.26901-1-daniel@zonque.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Dmitry,

On Saturday, June 23, 2018 05:45 PM, Daniel Mack wrote:
> This is v2 of the series that brings DT bindings to the eeti driver and
> cleans up the code a bit.

Is this set good to go in or should I repost it with Rob's Reviewed-by 
in 1/4?


Thanks,
Daniel


> 
> Changelog:
> 
> v1 → v2:
> * dropped module parameters
> * use touchscreen_report_pos() and drop some code for that
> * squashes 4/5 and 5/5 of v1
> 
> Daniel Mack (4):
>    dt-bindings: input: touchscreen: add bindings for eeti touchscreen
>      controller
>    input: touchscreen: eeti: add device tree matching table
>    input: touchscreen: eeti: drop module parameters, parse DT properties
>    input: touchscreen: eeti: fix link to documentation and email address
>      in header
> 
>   .../bindings/input/touchscreen/eeti.txt       | 31 ++++++++++++++++
>   drivers/input/touchscreen/eeti_ts.c           | 37 +++++++++----------
>   2 files changed, 48 insertions(+), 20 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/input/touchscreen/eeti.txt
> 

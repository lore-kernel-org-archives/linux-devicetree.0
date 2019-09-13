Return-Path: <SRS0=ihK2=XI=vger.kernel.org=devicetree-owner@kernel.org>
Received: from fllv0015.ext.ti.com ([198.47.19.141]:56604 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388524AbfIMNgB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Sep 2019 09:36:01 -0400
Subject: Re: v7 EL15203000
References: <20190912221115.23595-1-oleg@kaa.org.ua>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <3ea2514d-1e9a-8cf0-0ff4-a4430e46cbdb@ti.com>
Date: Fri, 13 Sep 2019 08:36:18 -0500
MIME-Version: 1.0
In-Reply-To: <20190912221115.23595-1-oleg@kaa.org.ua>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
To: Oleh Kravchenko <oleg@kaa.org.ua>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz
List-ID: <devicetree@vger.kernel.org>

Oleh

On 9/12/19 5:11 PM, Oleh Kravchenko wrote:
> [PATCH v8 1/2] dt-bindings: Add docs for EL15203000
> [PATCH v8 2/2] leds: add LED driver for EL15203000 board

$subject of cover letter should be v8

Dan

> Changes what was made:
> - removed odd spaces;
> - use only one return in el15203000_pattern_set_P();
> - reduce returns in el15203000_probe_dt();
> - remove ret variable from el15203000_probe().
>

Return-Path: <SRS0=tHxF=J5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ve1eur01on0101.outbound.protection.outlook.com ([104.47.1.101]:65044
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729765AbeGMQ1V (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 13 Jul 2018 12:27:21 -0400
Subject: Re: [PATCH] of: Export of_node_ktype
References: <20180713151450.2098-1-alexander.sverdlin@nokia.com>
 <8140ab69-3fa4-b448-0507-7b038f1d8b7b@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <be691b32-70b0-359a-2fc2-7d1c178ef085@nokia.com>
Date: Fri, 13 Jul 2018 18:11:34 +0200
MIME-Version: 1.0
In-Reply-To: <8140ab69-3fa4-b448-0507-7b038f1d8b7b@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hello Frank,

On 13/07/18 18:05, Frank Rowand wrote:
> I would not expect a generic module to need of_node_init().  So digging a
> little bit deeper, what module needs of_node_init() and how is it using it?

legacy out-of-tree modules which were implementing DT overlay functionality in pre-overlay
times.

-- 
Best regards,
Alexander Sverdlin.

Return-Path: <SRS0=6+2I=J5=gmail.com=frowand.list@kernel.org>
Subject: Re: [PATCH] of: Export of_node_ktype
References: <20180713151450.2098-1-alexander.sverdlin@nokia.com>
 <8140ab69-3fa4-b448-0507-7b038f1d8b7b@gmail.com>
 <be691b32-70b0-359a-2fc2-7d1c178ef085@nokia.com>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <4253eeb8-96bc-4ccd-774f-93145c14ef13@gmail.com>
Date: Fri, 13 Jul 2018 13:32:42 -0700
MIME-Version: 1.0
In-Reply-To: <be691b32-70b0-359a-2fc2-7d1c178ef085@nokia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Alexander Sverdlin <alexander.sverdlin@nokia.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 07/13/18 09:11, Alexander Sverdlin wrote:
> Hello Frank,
> 
> On 13/07/18 18:05, Frank Rowand wrote:
>> I would not expect a generic module to need of_node_init().  So digging a
>> little bit deeper, what module needs of_node_init() and how is it using it?
> 
> legacy out-of-tree modules which were implementing DT overlay functionality in pre-overlay
> times.

Thanks for the description.

The export should also stay out of tree.

-Frank

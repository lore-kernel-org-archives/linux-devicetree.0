From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] of/mdio: fix build errors when CONFIG_OF isn't set
Date: Wed, 14 Nov 2012 17:22:03 +0000
Message-ID: <CACxGe6sHhE2aLgzrRdwhWvmpp0KXtjVQrHxBJwUJvLeje8cK9g@mail.gmail.com>
References: <1349886683-26351-1-git-send-email-sasha.levin@oracle.com>
 <20121114161135.71E153E0B1E@localhost> <50A3D09E.4030609@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <50A3D09E.4030609@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Sasha Levin <sasha.levin@oracle.com>, rob.herring@calxeda.com, srinivas.kandagatla@st.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 14, 2012 at 5:10 PM, Rob Herring <robherring2@gmail.com> wrote:
> On 11/14/2012 10:11 AM, Grant Likely wrote:
>> On Wed, 10 Oct 2012 12:31:23 -0400, Sasha Levin <sasha.levin@oracle.com> wrote:
>>> Commit f9dc9ac5 ("of/mdio: Add dummy functions in of_mdio.h.") has added
>>> empty stubs into of_mdio.h which were not static, this causes build errors
>>> when these symbols were defined across several objects.
>>>
>>> Fix it by marking those stubs as 'static inline'.
>>>
>>> Signed-off-by: Sasha Levin <sasha.levin@oracle.com>
>>
>> Acked-by: Grant Likely <grant.likely@secretlab.ca>
>>
>> Rob, can you please pick up into your merge branch for device tree?
>>
>
> This is already fixed:

Even better! :-)

g.

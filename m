From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 1/2] of: return -ENOENT when no property
Date: Thu, 05 Jul 2012 09:20:39 -0500
Message-ID: <4FF5A2B7.4010401@gmail.com>
References: <1340945879-11712-1-git-send-email-acourbot@nvidia.com> <1340945879-11712-2-git-send-email-acourbot@nvidia.com> <CACRpkdbjHCc0pud8hnjJi1AMM5XQUmS=duhSnzXO+QO29YLk0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbjHCc0pud8hnjJi1AMM5XQUmS=duhSnzXO+QO29YLk0A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@stericsson.com>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 07/05/2012 08:26 AM, Linus Walleij wrote:
> On Fri, Jun 29, 2012 at 6:57 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:
> 
>> Make of_parse_phandle_with_args return -ENOENT instead of -EINVAL when
>> no matching property is found, which allows to discriminate between
>> absence of property and parsing error.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> 
> Rob can you take this into the DT git?

Yes.

Rob

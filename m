From: David Daney <david.daney@cavium.com>
Subject: Re: [PATCH v6 2/2] of: Make of_find_node_by_path() traverse /aliases
 for relative paths.
Date: Fri, 09 Mar 2012 09:59:01 -0800
Message-ID: <4F5A44E5.6090300@cavium.com>
References: <1330543264-18103-1-git-send-email-ddaney.cavm@gmail.com> <1330543264-18103-3-git-send-email-ddaney.cavm@gmail.com> <20120309013324.64DF53E0901@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120309013324.64DF53E0901@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: David Daney <ddaney.cavm@gmail.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "ralf@linux-mips.org" <ralf@linux-mips.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Rob Herring <rob.herring@calxeda.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 03/08/2012 05:33 PM, Grant Likely wrote:
> On Wed, 29 Feb 2012 11:21:04 -0800, David Daney<ddaney.cavm@gmail.com>  wrote:
>> From: David Daney<david.daney@cavium.com>
>>
>> Currently all paths passed to of_find_node_by_path() must begin with a
>> '/', indicating a full path to the desired node.
>>
>> Augment the look-up code so that if a path does *not* begin with '/',
>> the path is used as the name of an /aliases property.  The value of
>> this alias is then used as the full node path to be found.
>>
>> Signed-off-by: David Daney<david.daney@cavium.com>
[...]
>
> All the aliases are already decoded at boot time now.  See
> of_alias_scan().  Instead of open-coding this, you can add an
> of_alias_lookup() function something like this (untested):
>

After objections from davem, and a bit of thought, I already indicated 
on a different branch of this thread that we should drop this patch.

I have improved my code so that it is no longer needed.

Thanks,
David Daney

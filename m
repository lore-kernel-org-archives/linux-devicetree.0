From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v6 2/2] of: Make of_find_node_by_path() traverse /aliases
 for relative paths.
Date: Fri, 9 Mar 2012 11:00:44 -0700
Message-ID: <CACxGe6v3wnRdyaWeuBZ1RMQf8KD3dV2btQKrrmPAUgQtym_e_g@mail.gmail.com>
References: <1330543264-18103-1-git-send-email-ddaney.cavm@gmail.com>
 <1330543264-18103-3-git-send-email-ddaney.cavm@gmail.com> <20120309013324.64DF53E0901@localhost>
 <4F5A44E5.6090300@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4F5A44E5.6090300@cavium.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Daney <david.daney@cavium.com>
Cc: David Daney <ddaney.cavm@gmail.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "ralf@linux-mips.org" <ralf@linux-mips.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Rob Herring <rob.herring@calxeda.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 9, 2012 at 10:59 AM, David Daney <david.daney@cavium.com> w=
rote:
> On 03/08/2012 05:33 PM, Grant Likely wrote:
>>
>> On Wed, 29 Feb 2012 11:21:04 -0800, David Daney<ddaney.cavm@gmail.co=
m>
>> =A0wrote:
>>>
>>> From: David Daney<david.daney@cavium.com>
>>>
>>> Currently all paths passed to of_find_node_by_path() must begin wit=
h a
>>> '/', indicating a full path to the desired node.
>>>
>>> Augment the look-up code so that if a path does *not* begin with '/=
',
>>> the path is used as the name of an /aliases property. =A0The value =
of
>>> this alias is then used as the full node path to be found.
>>>
>>> Signed-off-by: David Daney<david.daney@cavium.com>
>
> [...]
>
>>
>> All the aliases are already decoded at boot time now. =A0See
>> of_alias_scan(). =A0Instead of open-coding this, you can add an
>> of_alias_lookup() function something like this (untested):
>>
>
> After objections from davem, and a bit of thought, I already indicate=
d on a
> different branch of this thread that we should drop this patch.
>
> I have improved my code so that it is no longer needed.

Okay.

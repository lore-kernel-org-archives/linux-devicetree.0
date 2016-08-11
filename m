From: Stewart Smith <stewart@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/4] dt-bindings: add doc for ibm,hotplug-aperture
Date: Thu, 11 Aug 2016 14:39:23 +1000
Message-ID: <874m6r2a2s.fsf@linux.vnet.ibm.com>
References: <1470680843-28702-1-git-send-email-arbab@linux.vnet.ibm.com> <1470680843-28702-2-git-send-email-arbab@linux.vnet.ibm.com> <92e34173-b2e2-bac0-3bbb-fc5407cbb8a5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <92e34173-b2e2-bac0-3bbb-fc5407cbb8a5@gmail.com>
Sender: owner-linux-mm@kvack.org
To: Balbir Singh <bsingharora@gmail.com>, Reza Arbab <arbab@linux.vnet.ibm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Jonathan Corbet <corbet@lwn.net>, Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Alistair Popple <apopple@au1.ibm.com>
List-Id: devicetree@vger.kernel.org

Balbir Singh <bsingharora@gmail.com> writes:
> On 09/08/16 04:27, Reza Arbab wrote:
>> Signed-off-by: Reza Arbab <arbab@linux.vnet.ibm.com>
>> ---
>>  .../bindings/powerpc/opal/hotplug-aperture.txt     | 26 ++++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>  create mode 100644
>> Documentation/devicetree/bindings/powerpc/opal/hotplug-aperture.txt

Forgive me for being absent on the whole discussion here, but is this an
OPAL specific binding? If so, shouldn't the docs also appear in the
skiboot tree?

-- 
Stewart Smith
OPAL Architect, IBM.

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>

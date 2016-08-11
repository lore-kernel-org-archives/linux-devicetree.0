From: Reza Arbab <arbab@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/4] dt-bindings: add doc for ibm,hotplug-aperture
Date: Thu, 11 Aug 2016 12:53:11 -0500
Message-ID: <20160811175311.GD12039@arbab-laptop.austin.ibm.com>
References: <1470680843-28702-1-git-send-email-arbab@linux.vnet.ibm.com>
 <1470680843-28702-2-git-send-email-arbab@linux.vnet.ibm.com>
 <92e34173-b2e2-bac0-3bbb-fc5407cbb8a5@gmail.com>
 <874m6r2a2s.fsf@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <874m6r2a2s.fsf@linux.vnet.ibm.com>
Sender: owner-linux-mm@kvack.org
To: Stewart Smith <stewart@linux.vnet.ibm.com>
Cc: Balbir Singh <bsingharora@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Jonathan Corbet <corbet@lwn.net>, Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Alistair Popple <apopple@au1.ibm.com>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 11, 2016 at 02:39:23PM +1000, Stewart Smith wrote:
>Forgive me for being absent on the whole discussion here, but is this 
>an OPAL specific binding? If so, shouldn't the docs also appear in the
>skiboot tree?

Good question. I guess it's not necessarily OPAL-specific, even though 
OPAL may initially be the only implementor of the binding.

Would it be more appropriate to move the file up a directory, directly 
under Documentation/devicetree/bindings/powerpc? I hesitated at that 
because the binding is tied to "ibm,associativity".

-- 
Reza Arbab

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>

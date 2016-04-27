From: Stewart Smith <stewart@linux.vnet.ibm.com>
Subject: Re: [PATCH V2 1/2] devicetree/bindings: Add binding for operator panel on FSP machines
Date: Wed, 27 Apr 2016 15:03:28 +1000
Message-ID: <87mvofiqxr.fsf@linux.vnet.ibm.com>
References: <1460423107-7270-1-git-send-email-sjitindarsingh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460423107-7270-1-git-send-email-sjitindarsingh@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: arnd@arndb.de
Cc: devicetree@vger.kernel.org, Suraj Jitindar Singh <sjitindarsingh@gmail.com>, linux-kernel@vger.kernel.org, paulus@samba.org, andrew.donnellan@au1.ibm.com, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Suraj Jitindar Singh <sjitindarsingh@gmail.com> writes:
> Add a binding to Documentation/devicetree/bindings/powerpc/opal
> (oppanel-opal.txt) for the operator panel which is present on IBM
> pseries machines with FSPs.

It's not pseries (as that implies PowerVM / PAPR) - while here we're all
about OPAL.

With a slight change to the commit message,
Acked-by: Stewart Smith <stewart@linux.vnet.ibm.com>


-- 
Stewart Smith
OPAL Architect, IBM.

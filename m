From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] dt: add of_get_property_value32 helper function
Date: Thu, 23 Jun 2011 14:12:17 -0600
Message-ID: <BANLkTi=5Pbg6x3rf-4Z3QxbUnaKddad3Zw@mail.gmail.com>
References: <1308847113-5953-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1308847113-5953-1-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 23, 2011 at 10:38 AM, Rob Herring <robherring2@gmail.com> wrote:
> From: Rob Herring <rob.herring@calxeda.com>
>
> A common use of of_get_property in driver is to just get a 32-bit integer
> value, but the interface is a bit complicated in that case. Add a helper
> function that just fills in the value.

Hey Rob,

I already asked Thomas Abraham to write a patch that does exactly
this.  He's already posted his first draft to the list.  His version
also covers u64 and strings, so I'm going to let him respin his
version and pick that one up.

> Grant,
>
> I noticed most callers of of_get_property don't do be32_to_cpup on the
> returned pointer. Most instances appear to be powerpc only drivers, but
> should of_get_property return ptr be __be32?

No.  Not all properties contain cell values.  Having of_get_property
return void* is the correct behaviour.

g.

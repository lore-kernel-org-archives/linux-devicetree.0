From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v2 0/6]  of: overlays: New target methods
Date: Thu, 26 May 2016 14:15:46 -0700
Message-ID: <57476782.3040703@gmail.com>
References: <1463429892-3369-1-git-send-email-pantelis.antoniou@konsulko.com>
Reply-To: frowand.list@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463429892-3369-1-git-send-email-pantelis.antoniou@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Rob Herring <robherring2@gmail.com>, Matt Porter <mporter@konsulko.com>, Grant Likely <grant.likely@secretlab.ca>, Koen Kooi <koen@dominion.thruhere.net>, Guenter Roeck <linux@roeck-us.net>, Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Pantelis Antoniou <panto@antoniou-consulting.com>
List-Id: devicetree@vger.kernel.org

On 5/16/2016 1:18 PM, Pantelis Antoniou wrote:
> This patchset implements two new target methods.
> 
> A target index method which allows selecting different
> targets according to an argument using an extended API and
> a target root method that fences the target only
> to a specific given root.
> 
> Documentation and unit-tests are included.

I think you are attacking the problem the wrong way.

If I understand correctly, the problem statement is:

  In some cases, a devicetree overlay is meant to describe
  a pluggable piece of hardware, which may be plugged into
  various locations on a platform.  It should be possible
  to apply a single devicetree to one or more locations
  on a given platform.

If that is the case, then putting the locations where the
overlay can be applied into the devicetree is not the
approach that I would use.  It seems it would be better
to specify the target location as a separate item from
the overlay to the method that applies the devicetree.
In that case, I would put the node(s) describing the
pluggable hardware in the root node of the overlay
devicetree (dtc expects a root node).  The apply
method can easily find the node(s) and relocate them
to the appropriate location in the platform's
devicetree.

-Frank

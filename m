From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] of: Fix locking when calling of_get_next_available_child()
Date: Wed, 13 Feb 2013 10:08:51 +0000
Message-ID: <20130213100851.7620A3E23F1@localhost>
References: <1360621157-23570-1-git-send-email-grant.likely@secretlab.ca> <51197E36.8080704@wwwdotorg.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51197E36.8080704@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robherring2@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, 11 Feb 2013 16:26:46 -0700, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 02/11/2013 03:19 PM, Grant Likely wrote:
> > of_get_next_available_child() obtains the devtree_lock and then calls
> > of_device_is_available() which also attempts to claim the lock. This is
> > obviously incorrect and causes a deadlock on boot. Fix issue by adding
> > an variant of of_device_is_available() which doesn't obtain the lock.
> 
> This patch forgets to update __of_device_is_available() to call
> __of_get_property() rather than of_get_property() and hence doesn't
> actually solve the problem.
> 
> You might want to make __of_device_is_available() static too.

Okay, I've dropped this patch and replaced it with your version since
you're actually doing better testing that I it would appear. I had to
respin my tree anyway because I messed up a merge of Rob's branch. :-(
Sorry for the noise.

New version of the tree is pushed out.

g.

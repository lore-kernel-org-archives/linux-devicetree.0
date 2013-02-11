From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] of: Fix locking when calling of_get_next_available_child()
Date: Mon, 11 Feb 2013 16:26:46 -0700
Message-ID: <51197E36.8080704@wwwdotorg.org>
References: <1360621157-23570-1-git-send-email-grant.likely@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1360621157-23570-1-git-send-email-grant.likely@secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robherring2@gmail.com>
List-Id: devicetree@vger.kernel.org

On 02/11/2013 03:19 PM, Grant Likely wrote:
> of_get_next_available_child() obtains the devtree_lock and then calls
> of_device_is_available() which also attempts to claim the lock. This is
> obviously incorrect and causes a deadlock on boot. Fix issue by adding
> an variant of of_device_is_available() which doesn't obtain the lock.

This patch forgets to update __of_device_is_available() to call
__of_get_property() rather than of_get_property() and hence doesn't
actually solve the problem.

You might want to make __of_device_is_available() static too.

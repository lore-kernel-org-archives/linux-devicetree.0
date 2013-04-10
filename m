From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Apr 10 (meda and OF)
Date: Wed, 10 Apr 2013 14:36:20 -0700
Message-ID: <5165DB54.90508@infradead.org>
References: <20130410184852.92a3a02bbe5c3a040be76365@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130410184852.92a3a02bbe5c3a040be76365@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media <linux-media@vger.kernel.org>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 04/10/13 01:48, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20130409:
> 


on i386:

ERROR: "of_get_next_parent" [drivers/media/v4l2-core/videodev.ko] undefined!


'of_get_next_parent()' should be exported for use by modules...?


-- 
~Randy

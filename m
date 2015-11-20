From: Greg Hackmann <ghackmann@google.com>
Subject: Re: [PATCH v2] pstore-ram: add Device Tree bindings
Date: Fri, 20 Nov 2015 10:32:08 -0800
Message-ID: <564F6728.7050607@google.com>
References: <1447719205-8571-1-git-send-email-ghackmann@google.com>
 <20151117211717.GA12750@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20151117211717.GA12750@rob-hp-laptop>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/17/2015 01:17 PM, Rob Herring wrote:
>> +- record-size: maximum size in bytes of each dump done on oops/panic
>> +  (defaults to 0)
>
> Perhaps the default should be something useful.

It's kind of a weird default, but I don't have any ideas for a better one.

First, the size you want is really determined by the number of dumps you 
want to keep in your circular buffer. That's not something I want to 
guess at.

Second, at least IME, a lot of devices legitimately want this set to 0. 
They're pulling in ramoops for the persistent kernel and userspace logs.

>> +- unbuffered: if present, use uncached mappings to map the reserved region
>> +  (defaults to cached mappings)
>
> It defaults to write-combined or buffered which is not really cached.

Will fix.

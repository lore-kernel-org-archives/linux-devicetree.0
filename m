From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Devicetree Specification 0.2
Date: Wed, 20 Dec 2017 16:05:20 +0000
Message-ID: <CACxGe6vqo3ZF9Ms_2zZTpHUx3qW6VZqDL1BstkX8uKBQWCMq-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi all,

I've just released v0.2 of the devicetree specification. You can find
the prebuilt PDF on the release page here:

https://github.com/devicetree-org/devicetree-specification/releases/tag/v0.2

The document text is also published on readthedocs (unofficially; the
pdf is considered authoritative):

http://devicetree-specification.readthedocs.io/en/latest/

Please go take a look. Comments can be made here, or posted as issues
on the GitHub page. Or better yet, submit patches!

https://github.com/devicetree-org/devicetree-specification/issues

Cheers,
g.

---

Mostly editorial changes from v0.1. Primary purpose for this release is to work
through the mechanics of cutting a release. Right now it is more labour
intensive than I would like for two reasons:

- The GitHub OAuth key must be manually changed to the person cutting the
  release. I would like it to be automatically selected based on who signed
  the release tag
- The pre-release flag needs to be manually changed between -pre/-rc and full
  releases. This also should be automatically determined based on tag pattern
  matching

Content changes include:
* Added more recommended generic node names
* Added interrupts-extended
* Additional phy times
* Filled out detail in source language chapter
* Editorial changes
* Added changebar version to release documents
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
